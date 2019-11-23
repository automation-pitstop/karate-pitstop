Feature: This is a sample feature for demonstration

	Background:
		* url baseUrl
		#* configure headers = read('classpath:headers.js')
		
		Scenario:
		When path LIST_USERS
		When method get
		Then status 200