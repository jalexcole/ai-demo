package io.cole;

import java.nio.file.Paths;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.nio.file.Path;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;
import org.tribuo.*;
import org.tribuo.evaluation.TrainTestSplitter;
import org.tribuo.data.csv.CSVLoader;
import org.tribuo.classification.*;
import org.tribuo.classification.evaluation.*;
import org.tribuo.classification.sgd.linear.LogisticRegressionTrainer;

import com.fasterxml.jackson.databind.*;
import com.oracle.labs.mlrg.olcut.provenance.ProvenanceUtil;
import com.oracle.labs.mlrg.olcut.config.json.*;

public interface App {
    static final Logger logger = Logger.getLogger(App.class.getName());
    static final ObjectMapper objectMapper = new ObjectMapper();

    public static void classification() throws IOException {
        var labelFactory = new LabelFactory();
        var csvLoader = new CSVLoader<>(labelFactory);

        var irisHeaders = new String[] { "sepalLength", "sepalWidth", "petalLength", "petalWidth", "species" };
        var irisesSource = csvLoader.loadDataSource(Paths.get("bezdekIris.data"), "species", irisHeaders);
        var irisSplitter = new TrainTestSplitter<>(irisesSource, 0.7, 1L);

        var trainingDataset = new MutableDataset<>(irisSplitter.getTrain());
        var testingDataset = new MutableDataset<>(irisSplitter.getTest());
        logger.info(extracted(trainingDataset));
        logger.info(String.format("Testing data size = %d, number of features = %d, number of classes = %d",
                testingDataset.size(), testingDataset.getFeatureMap().size(), testingDataset.getOutputInfo().size()));

        Trainer<Label> trainer = new LogisticRegressionTrainer();
        logger.info(trainer.toString());

        Model<Label> irisModel = trainer.train(trainingDataset);

        var evaluator = new LabelEvaluator();
        var evaluation = evaluator.evaluate(irisModel, testingDataset);
        logger.info(evaluation.toString());

        logger.info(evaluation.getConfusionMatrix().toString());

        var featureMap = irisModel.getFeatureIDMap();
        for (var v : featureMap) {
            logger.info(v.toString());
            logger.info("");
        }

        var provenance = irisModel.getProvenance();
        logger.info(
                ProvenanceUtil.formattedProvenanceString(provenance.getDatasetProvenance().getSourceProvenance()));

        logger.info(ProvenanceUtil.formattedProvenanceString(provenance.getTrainerProvenance()));
        ObjectMapper objMapper = new ObjectMapper();
        objMapper.registerModule(new JsonProvenanceModule());
        objMapper = objMapper.enable(SerializationFeature.INDENT_OUTPUT);

        String jsonProvenance = objMapper.writeValueAsString(ProvenanceUtil.marshalProvenance(provenance));
        logger.info(jsonProvenance);

        logger.info(irisModel.toString());
        String jsonEvaluationProvenance = objMapper
                .writeValueAsString(ProvenanceUtil.convertToMap(evaluation.getProvenance()));
        logger.info(jsonEvaluationProvenance);

        File tmpFile = new File("iris-lr-model.ser");
        try (ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream(tmpFile))) {
            oos.writeObject(irisModel);
        }

        // String filterPattern =
        // Files.readAllLines(Paths.get("../docs/jep-290-filter.txt")).get(0);
        // ObjectInputFilter filter =
        // ObjectInputFilter.Config.createFilter(filterPattern);
        // Model<?> loadedModel;
        // try (ObjectInputStream ois = new ObjectInputStream(new
        // BufferedInputStream(new FileInputStream(tmpFile)))) {
        // ois.setObjectInputFilter(filter);
        // loadedModel = (Model<?>) ois.readObject();
        // }

        // First save the model
        Path outputPath = Paths.get("iris-lr-model.pb");
        try {
            irisModel.serializeToFile(outputPath);
        } catch (IOException e) {
            logger.info("Exception when writing - " + e);
        }

        // Then load it back in
        Model<?> loadedPBModel = Model.deserializeFromFile(outputPath);

        // if (loadedModel.validate(Label.class)) {
        // logger.info("It's a Model<Label>!");
        // } else {
        // logger.info("It's some other kind of Model.");
        // }

        // Model<Label> model = loadedModel.castModel(Label.class);

        // loadedModel.getProvenance().equals(irisModel.getProvenance());
    }

    private static String extracted(MutableDataset<Label> trainingDataset) {
        return String.format("Training data size = %d, number of features = %d, number of classes = %d",
                trainingDataset.size(), trainingDataset.getFeatureMap().size(),
                trainingDataset.getOutputInfo().size());
    }

    public static void main(String[] args) {
        try {
            classification();
            TensorflowExample.tensorflow();
        } catch (IOException e) {
            logger.log(Level.SEVERE, e.getMessage(), e.fillInStackTrace());
        }

    }
}