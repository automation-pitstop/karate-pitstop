package com.automation.pitstop.runner;

import org.junit.BeforeClass;
import org.junit.runner.RunWith;

import com.intuit.karate.junit4.Karate;

/**
 *
 * @author 
 */
@RunWith(Karate.class)
public abstract class TestBase {
    
    @BeforeClass
    public static void beforeClass() throws Exception {
    	System.out.println("--------------BaseMethodCalled----------");
    }
    
}
