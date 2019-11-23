function fn() {   
  // don't waste time waiting for a connection or if servers don't respond within 10 seconds
  karate.configure('connectTimeout', 10000); //Default is 30 seconds if not set
  karate.configure('readTimeout', 10000);  //Default is 30 seconds if not set
  karate.configure('retry',{count: 3, interval: 5000}) //Configure the retry count
  
  // Create you own system variable which can be called in command line by -D
  //var port = karate.properties['server.port']; 
  //karate.log('server.port property was:', port);
  
  //retrieve operating-system environment variables
  //var systemPath = java.lang.System.getenv('PATH');
  //karate.log('system path property was:', systemPath);
  
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was :', env);
  
  if (!env) {
    env = 'tst';
	karate.log('Since \'karate.env\' was not set. Loading default environment :', env);
  }

  //Load the environment data
  var config = read('classpath:env_data.json');
  var configMain = config[env];
  
  //Load the endpoint data
  var endPointsData = read('classpath:endpoints.json');
  for(var key in endPointsData){
	  configMain[key] = endPointsData[key]
  }
  
  //Load the common data
  var commonData = read('classpath:common_data.json');
  for(var key in commonData){
	  configMain[key] = commonData[key]
  }
  
  return configMain;
}