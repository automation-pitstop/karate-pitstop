function fn() {   
  // don't waste time waiting for a connection or if servers don't respond within 10 seconds
  karate.configure('connectTimeout', 10000);
  karate.configure('readTimeout', 10000); 
  
  // Create you own system variable which can be called in command line by -D
  var port = karate.properties['server.port']; 
  karate.log('server.port property was:', port);
  
  //retrieve operating-system environment variables
  //var systemPath = java.lang.System.getenv('PATH');
  //karate.log('system path property was:', systemPath);
  
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was :', env);
  
  if (!env) {
    env = 'dev';
  }

/* 
 //----- Block to provide env varaibles---------
   var config = {
	env: env,
	baseUrl: 'https://jsonplaceholder.typicode.com'
	}
  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
    config.baseUrl = 'https://jsonplaceholder.typicode.com'
	
  } else if (env == 'tst') {
    config.baseUrl = 'https://reqres.in/api'
  }
  return config; 
  //-----------------------------------------------
  */
  
  //Below code is to load the data from the json data file from classpath
  var config = read('classpath:env_data.json');
  return config[env];
}