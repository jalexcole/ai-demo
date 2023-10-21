package io.cole;

import java.io.IOException;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Logger;

import org.tribuo.*;
import org.tribuo.data.csv.CSVLoader;
import org.tribuo.datasource.IDXDataSource;
import org.tribuo.evaluation.TrainTestSplitter;
import org.tribuo.classification.*;
import org.tribuo.classification.evaluation.*;
import org.tribuo.interop.tensorflow.*;
import org.tribuo.interop.tensorflow.example.*;
import org.tribuo.regression.*;
import org.tribuo.regression.evaluation.*;
import org.tribuo.util.Util;

import org.tensorflow.*;
import org.tensorflow.framework.initializers.*;
import org.tensorflow.ndarray.Shape;
import org.tensorflow.op.*;
import org.tensorflow.op.core.*;
import org.tensorflow.types.*;

public interface TensorflowExample {

    static final Logger logger = Logger.getLogger(TensorflowExample.class.getName());

    public static void tensorflow() throws IOException {
        // First we load winequality
        var regressionFactory = new RegressionFactory();
        var regEval = new RegressionEvaluator();
        var csvLoader = new CSVLoader<>(';', regressionFactory);
        var wineSource = csvLoader.loadDataSource(Paths.get("winequality-red.csv"), "quality");
        var wineSplitter = new TrainTestSplitter<>(wineSource, 0.7f, 0L);
        var wineTrain = new MutableDataset<>(wineSplitter.getTrain());
        var wineTest = new MutableDataset<>(wineSplitter.getTest());

        // Now we load MNIST
        var labelFactory = new LabelFactory();
        var labelEval = new LabelEvaluator();
        var mnistTrainSource = new IDXDataSource<>(Paths.get("train-images-idx3-ubyte.gz"),
                Paths.get("train-labels-idx1-ubyte.gz"), labelFactory);
        var mnistTestSource = new IDXDataSource<>(Paths.get("t10k-images-idx3-ubyte.gz"),
                Paths.get("t10k-labels-idx1-ubyte.gz"), labelFactory);
        var mnistTrain = new MutableDataset<>(mnistTrainSource);
        var mnistTest = new MutableDataset<>(mnistTestSource);

        var wineGraph = new Graph();
        // This object is used to write operations into the graph
        var wineOps = Ops.create(wineGraph);
        var wineInputName = "WINE_INPUT";
        long wineNumFeatures = wineTrain.getFeatureMap().size();
        var wineInitializer = new Glorot<TFloat32>(// Initializer distribution
                VarianceScaling.Distribution.TRUNCATED_NORMAL,
                // Initializer seed
                Trainer.DEFAULT_SEED);

        // The input placeholder that we'll feed the features into
        var wineInput = wineOps.withName(wineInputName).placeholder(TFloat32.class,
                Placeholder.shape(Shape.of(-1, wineNumFeatures)));

        // Fully connected layer (numFeatures -> 30)
        var fc1Weights = wineOps.variable(wineInitializer.call(wineOps, wineOps.array(wineNumFeatures, 30L),
                TFloat32.class));
        var fc1Biases = wineOps.variable(wineOps.fill(wineOps.array(30), wineOps.constant(0.1f)));
        var sigmoid1 = wineOps.math.sigmoid(wineOps.math.add(wineOps.linalg.matMul(wineInput, fc1Weights),
                fc1Biases));

        // Fully connected layer (30 -> 20)
        var fc2Weights = wineOps.variable(wineInitializer.call(wineOps, wineOps.array(30L, 20L),
                TFloat32.class));
        var fc2Biases = wineOps.variable(wineOps.fill(wineOps.array(20), wineOps.constant(0.1f)));
        var sigmoid2 = wineOps.math.sigmoid(wineOps.math.add(wineOps.linalg.matMul(sigmoid1, fc2Weights),
                fc2Biases));

        // Output layer (20 -> 1)
        var outputWeights = wineOps.variable(wineInitializer.call(wineOps, wineOps.array(20L, 1L),
                TFloat32.class));
        var outputBiases = wineOps.variable(wineOps.fill(wineOps.array(1), wineOps.constant(0.1f)));
        var outputOp = wineOps.math.add(wineOps.linalg.matMul(sigmoid2, outputWeights), outputBiases);

        // Get the operation name to pass into the trainer
        var wineOutputName = outputOp.op().name();

        var gradAlgorithm = GradientOptimiser.ADAGRAD;
        var gradParams = Map.of("learningRate", 0.1f, "initialAccumulatorValue", 0.01f);

        var wineDenseConverter = new DenseFeatureConverter(wineInputName);
        var wineOutputConverter = new RegressorConverter();

        var wineTrainer = new TensorFlowTrainer<Regressor>(wineGraph,
                wineOutputName,
                gradAlgorithm,
                gradParams,
                wineDenseConverter,
                wineOutputConverter,
                16, // training batch size
                100, // number of training epochs
                16, // test batch size of the trained model
                -1 // disable logging of the loss value
        );

        // Now we close the original graph to free the associated native resources.
        // The TensorFlowTrainer keeps a copy of the GraphDef protobuf to rebuild it
        // when necessary.
        wineGraph.close();

        var wineStart = System.currentTimeMillis();
        var wineModel = wineTrainer.train(wineTrain);
        var wineEnd = System.currentTimeMillis();
        logger.info("Wine quality training took " + Util.formatDuration(wineStart, wineEnd));

        var wineEvaluation = regEval.evaluate(wineModel, wineTest);
        var dimension = new Regressor("DIM-0", Double.NaN);
        logger.info(String.format("Wine quality evaluation:%n  RMSE %f%n  MAE %f%n  R^2 %f%n",
                wineEvaluation.rmse(dimension),
                wineEvaluation.mae(dimension),
                wineEvaluation.r2(dimension)));

        var mnistInputName = "MNIST_INPUT";
        var mnistMLPTuple = MLPExamples.buildMLPGraph(
                mnistInputName, // The input placeholder name
                mnistTrain.getFeatureMap().size(), // The number of input features
                new int[] { 300, 200, 30 }, // The hidden layer sizes
                mnistTrain.getOutputs().size() // The number of output labels
        );
        var mnistDenseConverter = new DenseFeatureConverter(mnistInputName);
        var mnistOutputConverter = new LabelConverter();

        var mnistMLPTrainer = new TensorFlowTrainer<Label>(mnistMLPTuple.graphDef,
                mnistMLPTuple.outputName, // the name of the logit operation
                gradAlgorithm, // the gradient descent algorithm
                gradParams, // the gradient descent hyperparameters
                mnistDenseConverter, // the input feature converter
                mnistOutputConverter, // the output label converter
                16, // training batch size
                20, // number of training epochs
                16, // test batch size of the trained model
                -1 // disable logging of the loss value
        );

        var mlpStart = System.currentTimeMillis();
        var mlpModel = mnistMLPTrainer.train(mnistTrain);
        var mlpEnd = System.currentTimeMillis();
        logger.info("MNIST MLP training took " + Util.formatDuration(mlpStart, mlpEnd));

        var mlpEvaluation = labelEval.evaluate(mlpModel, mnistTest);
        logger.info(mlpEvaluation.toString());
        logger.info(mlpEvaluation.getConfusionMatrix().toString());

        var mnistCNNTuple = CNNExamples.buildLeNetGraph(mnistInputName, 28, 255, mnistTrain.getOutputs().size());
        var mnistImageConverter = new ImageConverter(mnistInputName, 28, 28, 1);

        var mnistCNNTrainer = new TensorFlowTrainer<Label>(mnistCNNTuple.graphDef,
                mnistCNNTuple.outputName, // the name of the logit operation
                gradAlgorithm, // the gradient descent algorithm
                gradParams, // the gradient descent hyperparameters
                mnistImageConverter, // the input feature converter
                mnistOutputConverter, // the output label converter
                16, // training batch size
                3, // number of training epochs
                16, // test batch size of the trained model
                -1 // disable logging of the loss value
        );

        // Training the model
        var cnnStart = System.currentTimeMillis();
        var cnnModel = mnistCNNTrainer.train(mnistTrain);
        var cnnEnd = System.currentTimeMillis();
        logger.info("MNIST CNN training took " + Util.formatDuration(cnnStart, cnnEnd));

        var cnnPredictions = cnnModel.predict(mnistTest);
        var cnnEvaluation = labelEval.evaluate(cnnModel, cnnPredictions, mnistTest.getProvenance());
        logger.info(cnnEvaluation.toString());
        logger.info(cnnEvaluation.getConfusionMatrix().toString());

        var outputPath = "./tf-cnn-mnist-model";
        cnnModel.exportModel(outputPath);

        var outputMapping = new HashMap<Label, Integer>();
        for (var p : cnnModel.getOutputIDInfo()) {
            outputMapping.put(p.getB(), p.getA());
        }
        var featureIDMap = cnnModel.getFeatureIDMap();
        var featureMapping = new HashMap<String, Integer>();
        for (var info : featureIDMap) {
            featureMapping.put(info.getName(), featureIDMap.getID(info.getName()));
        }

        var externalModel = TensorFlowSavedModelExternalModel.createTensorflowModel(
                labelFactory, // the output factory
                featureMapping, // the feature mapping
                outputMapping, // the output mapping
                cnnModel.getOutputName(), // the name of the *softmax* output
                mnistImageConverter, // the input feature converter
                mnistOutputConverter, // The label converter
                outputPath.toString() // path to the saved model
        );

        var externalPredictions = externalModel.predict(mnistTest);

        var isEqual = true;
        for (int i = 0; i < cnnPredictions.size(); i++) {
            var tribuo = cnnPredictions.get(i);
            var external = externalPredictions.get(i);
            isEqual &= tribuo.getOutput().fullEquals(external.getOutput());
            isEqual &= tribuo.distributionEquals(external);
        }
        logger.info("Predictions are " + (isEqual ? "equal" : "not equal"));

    }

    /**
     * To solve this regression task we're going to build a 3 layer neural network,
     * where each layer is a "dense" or "MLP" layer. We'll use a sigmoid as the
     * activation function, but any supported one in TensorFlow will work. We'll
     * need to know the number of input features and the number of output dimensions
     * (i.e., the number of labels or regression dimensions), which is a little
     * unfortunate as nothing else in Tribuo requires it, but it's required to build
     * the structure.
     * 
     * @param wineTrain
     * @return
     */
    public static String buildModel(MutableDataset<Regressor> wineTrain) {
        var wineGraph = new Graph();
        // This object is used to write operations into the graph
        var wineOps = Ops.create(wineGraph);
        var wineInputName = "WINE_INPUT";
        long wineNumFeatures = wineTrain.getFeatureMap().size();
        var wineInitializer = new Glorot<TFloat32>(// Initializer distribution
                VarianceScaling.Distribution.TRUNCATED_NORMAL,
                // Initializer seed
                Trainer.DEFAULT_SEED);

        // The input placeholder that we'll feed the features into
        var wineInput = wineOps.withName(wineInputName).placeholder(TFloat32.class,
                Placeholder.shape(Shape.of(-1, wineNumFeatures)));

        // Fully connected layer (numFeatures -> 30)
        var fc1Weights = wineOps.variable(wineInitializer.call(wineOps, wineOps.array(wineNumFeatures, 30L),
                TFloat32.class));
        var fc1Biases = wineOps.variable(wineOps.fill(wineOps.array(30), wineOps.constant(0.1f)));
        var sigmoid1 = wineOps.math.sigmoid(wineOps.math.add(wineOps.linalg.matMul(wineInput, fc1Weights),
                fc1Biases));

        // Fully connected layer (30 -> 20)
        var fc2Weights = wineOps.variable(wineInitializer.call(wineOps, wineOps.array(30L, 20L),
                TFloat32.class));
        var fc2Biases = wineOps.variable(wineOps.fill(wineOps.array(20), wineOps.constant(0.1f)));
        var sigmoid2 = wineOps.math.sigmoid(wineOps.math.add(wineOps.linalg.matMul(sigmoid1, fc2Weights),
                fc2Biases));

        // Output layer (20 -> 1)
        var outputWeights = wineOps.variable(wineInitializer.call(wineOps, wineOps.array(20L, 1L),
                TFloat32.class));
        var outputBiases = wineOps.variable(wineOps.fill(wineOps.array(1), wineOps.constant(0.1f)));
        var outputOp = wineOps.math.add(wineOps.linalg.matMul(sigmoid2, outputWeights), outputBiases);

        // Get the operation name to pass into the trainer
        var wineOutputName = outputOp.op().name();

        return wineOutputName;
    }

}
