Feature: Call Single Function Automation

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
    * def token = authInfo.authToken
    * print token

  Scenario: Verify automation of call single feature
    Given path 'public/v2/users'
    And header Authorization = token
    And request reqPayload
    When method POST
    Then status 201
    * print response
    And match $.id =='#present'
    And match $.name =='Qwerty'
    And match $.email == reqPayload.email
  