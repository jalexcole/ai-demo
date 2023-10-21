package io.cole;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.logging.Level;
import java.util.logging.Logger;

import org.junit.jupiter.api.Test;
import org.tensorflow.ConcreteFunction;
import org.tensorflow.TensorFlow;
import org.tensorflow.op.Ops;
import org.tensorflow.op.core.Placeholder;
import org.tensorflow.op.math.Add;
import org.tensorflow.types.TInt32;

import org.tensorflow.Signature;
import org.tensorflow.Tensor;



public class TensorflowTest {

    private static final Logger logger = Logger.getLogger(TensorflowTest.class.getName());

    @Test
    public void tensorflowInit() {
        System.out.println("Hello TensorFlow " + TensorFlow.version());

        try (ConcreteFunction dbl = ConcreteFunction.create(TensorflowTest::dbl);
                TInt32 x = TInt32.scalarOf(10);
                Tensor dblX = dbl.call(x)) {
            System.out.println(x.getInt() + " doubled is " + ((TInt32) dblX).getInt());
        } catch (Exception e) {
            logger.log(Level.WARNING, e.getMessage(), e.fillInStackTrace());
            assertFalse(true);
        }

        assertTrue(true);

    }

    private static Signature dbl(Ops tf) {
        Placeholder<TInt32> x = tf.placeholder(TInt32.class);
        Add<TInt32> dblX = tf.math.add(x, x);
        return Signature.builder().input("x", x).output("dbl", dblX).build();
    }

   

}
