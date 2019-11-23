Feature: This is a test feature
 
	Scenario: Test scenario	1
	
	Given def myVar = 'myVar'
	* print myVar
	* def mySecondVar = 5
	* def myNewVar = myVar + mySecondVar
	Then match myNewVar == 'myVar5'
	
	
	Scenario: Check the print functionality
	* def myJson = { foo: 'bar', baz: [1, 2, 3] }
	* print 'the value of myJson is:', myJson 
	* print 'the value of myJson is:\n' + karate.pretty(myJson)
	#* print 'the value of myJson is:\n' + karate.prettyXml(myXml)  //--------------------------------------------------
	
	* def cat = { name: 'Billie', scores: [2, 5] }
	* assert cat.scores[1] == 5
	* print 'Cat.name is : ' , cat.name
	
	* def cats = [{ name: 'Billie' }, { name: 'Bob' }]
* match cats[1] == { name: 'Bob' }

#Assign parts of a JSON instance into another variable //--------------------------------------------------
* def cats = [{ name: 'Billie' }, { name: 'Bob' }]
* match cats[1] == { name: 'Bob' }

#xml //--------------------------------------------------
Given def cat = <cat><name>Billie</name><scores><score>2</score><score>5</score></scores></cat>
# sadly, xpath list indexes start from 1
Then match cat/cat/scores/score[2] == '5'
# but karate allows you to traverse xml like json !!
Then match cat.cat.scores.score[1] == '5'

#Embedded Expressions //--------------------------------------------------
Given def user = { name: 'john', age: 21 }
And def lang = 'en'
When def session = { name: '#(user.name)', locale: '#(lang)', sessionUser: '#(user)'  }

When def user = { name: 'john', age: 21 }
And def lang = 'en'

#Enclosed JavaScript //--------------------------------------------------
* def embedded = { name: '#(user.name)', locale: '#(lang)', sessionUser: '#(user)' }
* def enclosed = ({ name: user.name, locale: lang, sessionUser: user })
* match embedded == enclosed

#Multi-Line Expressions //--------------------------------------------------
# instead of:
* def cat = <cat><name>Billie</name><scores><score>2</score><score>5</score></scores></cat>

# this is more readable:
* def cat = 
  """
  <cat>
      <name>Billie</name>
      <scores>
          <score>2</score>
          <score>5</score>
      </scores>
  </cat>
  """
# example of a request payload in-line
Given request 
  """ 
  <?xml version='1.0' encoding='UTF-8'?>
  <S:Envelope xmlns:S="http://schemas.xmlsoap.org/soap/envelope/">
  <S:Body>
  <ns2:QueryUsageBalance xmlns:ns2="http://www.mycompany.com/usage/V1">
      <ns2:UsageBalance>
          <ns2:LicenseId>12341234</ns2:LicenseId>
      </ns2:UsageBalance>
  </ns2:QueryUsageBalance>
  </S:Body>
  </S:Envelope>
  """

# example of a payload assertion in-line
#Then match response ==
  #"""
  #{ id: { domain: "DOM", type: "entityId", value: "#ignore" },
    #created: { on: "#ignore" }, 
    #lastUpdated: { on: "#ignore" },
    #entityState: "ACTIVE"
  #}
  #"""
	