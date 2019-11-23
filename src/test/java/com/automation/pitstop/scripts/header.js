function fn(){
	var basicAuthString = karate.call('classpath:auth.js');
	return{
		Authorization: basicAuthString,
		'Content-type': 'application/json'
	};
}