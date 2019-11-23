"# karate-pitstop" 

Maven commands to run test on CI :

mvn clean test ==> This will run all the features under features folder

mvn clean test -DKarate.options="classpath:Sample.feature" ==> This will run only specified feature file

mvn clean test -Dtest=CIRunner -DKarate.options="classpath:Sample.feature" ==> use test variable to specify your custom runner

mvn clean test -Dkarate.env=dev ==> This will run the test in Dev environment. By default it will always run in TST

@ingnore ==> Use this tag to skip the scenarios