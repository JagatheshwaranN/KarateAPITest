Feature: POST API Automation

  @post
  Scenario: Create new user using post call
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
    * def randomStr = randomString(10)
    * print randomStr
    * def email = randomStr+"@gmail.com"
    * print email
    Given url 'https://gorest.co.in/public/v2'
    Given path '/users'
    And request { "name":"#(name)", "gender":"Male", "status":"active", email:"#(email)"}
    And header Authorization = 'Bearer '+tokenID
    When method POST
    Then status 201
    * print response
    And match $.id =='#present'
    And match $.name =='#present'
    And match $.email == '#present'
