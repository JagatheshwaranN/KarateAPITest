Feature: Actions Usage Automation

  Scenario: Verify the usage of the Action features (Replace)
    Given def text = 'Hello, Welcome <name> to world of Automation'
    When replace text.name = 'Jaga'
    Then print text
    And match text == 'Hello, Welcome Jaga to world of Automation'

  Scenario: Verify the usage of the Action features (Get)
    * def bike =
      """
      {
      type:'twowheller',
      company:[
      {name:'Hero', model:'splender'},
      {name:'Yamaha', model:'fz'}]
      }
      """
    * def compName = get bike.company[*].name
    * match compName == ['Hero','Yamaha']
    * def modelName = $bike.company[*].model
    * match modelName == ['splender', 'fz']

  Scenario: Verify the usage of the Action features (Remove)
    * def json = {id:'123', name:'john', phone:[987,987,9990]}
    * remove json.name
    * match json == {id:'123',phone:[987,987,9990]}

  Scenario: Verify the usage of the Action features (Call and Listen)
  * def pay = call read('Json.feature')
  * set pay.payload.email = "15042022@gmail.com"
  * def reqPL = pay.payload
  	Given url baseURL+'public/v2/users'
    And header Authorization = 'Bearer '+tokenID
    And request reqPL
    * print reqPL
    When method POST
    * listen 1000
    Then status 201
    * print response
