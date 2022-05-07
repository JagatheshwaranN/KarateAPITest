Feature: POST API Automation

  Background: 
    * url baseURL
    * def randomString =
      """
      function(s){
      var str = "";
      var pattern = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
      for(var i=0;i<s;i++){
      str += pattern.charAt(Math.floor(Math.random() * pattern.length()));
      }
      return str;
      }
      """
    * def reqPayload =
      """
      {
      "name":"Qwerty",
      "gender":"Male",
      "status":"active"
      }
      """
    * def randomStr = randomString(10)
    * print randomStr
    * reqPayload.email = randomStr+"@gmail.com"
    * print reqPayload

  @post
  Scenario: Create new user using post call
    Given path '/users'
    And request reqPayload
    And header Authorization = 'Bearer '+tokenID
    When method POST
    Then status 201
    * print response
    #And match $.data.id =='#present'
    #And match $.data.name =='Qwerty'
    #And match $.data.email == reqPayload.email
    And match $.id =='#present'
    And match $.name =='Qwerty'
    And match $.email == reqPayload.email

  @post1
  Scenario: Create new user using post call
    Given path '/users'
    And request reqPayload
    And header Authorization = 'Bearer '+tokenID
    When method POST
    Then status 201
    * print response
    #And match $.data.id =='#present'
    #And match $.data.name =='Qwerty'
    #And match $.data.email == reqPayload.email
    And match $.id =='#present'
    And match $.name =='Qwerty'
    And match $.email == reqPayload.email
