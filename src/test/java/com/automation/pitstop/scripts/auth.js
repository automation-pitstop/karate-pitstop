function auth(){
	var username = login_user;
	var password = login_password;
	var temp = username + ':' + password;
	var Base64 = Java.type('java.util.Base64');
	var ecnoded = Base64.getEncoder().encodeToString(temp.bytes);
	return 'Basic ' + encoded;
}