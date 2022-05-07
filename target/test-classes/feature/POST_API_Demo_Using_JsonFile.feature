Feature: POST API Automation

  Background: 
    * url baseURL
    * def randomString =
      """
      function(s){
      var str ="";
      var pattern = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
      for(var i=0; i<s;i++){
      str += pattern.charAt(Math.floor(Math.random() * pattern.length()));
      }
      return str;
      }

      """
    * def randomStr = randomString(10);
    * print randomStr
    #* def requestPayload = read('classpath:src/test/resources/payload/user.json')
    * def requestPayload = read('file:src/test/resources/payload/user.json')
    * set requestPayload.email = randomStr+"@gmail.com"
    * print requestPayload

  Scenario: Create new user using post with json file
    Given path 'public/v2/users'
    And request requestPayload
    And header Authorization = 'Bearer '+tokenID
    When method POST
    Then status 201
    * print response
    And match $.id =='#present'
    And match $.name =='Qwerty'
    And match $.email == requestPayload.email
