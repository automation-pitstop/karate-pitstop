package com.karate.runner;

import org.junit.runner.RunWith;

import com.intuit.karate.KarateOptions;
import com.intuit.karate.junit4.Karate;

@RunWith(Karate.class)
@KarateOptions(features = "classpath:com/karate/features/testing.feature", tags = "~@ignore") 
public class KarateRunner extends TestBase {
	
//    @Test
//    public void testParallel() {
//        Results results = Runner.parallel(getClass(), 5, "target/surefire-reports");
//        assertTrue(results.getErrorMessages(), results.getFailCount() == 0);
//    }

}