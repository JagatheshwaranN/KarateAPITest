Feature: POST and PUT API's Combo Automation

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
    * def postRequest =
      """
      {
        "name":"Tommy",
        "gender":"male",
        "status":"inactive"
      }
      """
    * def randomStr = randomString(10)
    * set postRequest.email = randomStr+"@gmail.com"
    * print postRequest

  Scenario: Create user using post call and update the same user using put call
    # User creation flow
    Given path 'public/v2/users'
    And request postRequest
    And header Authorization = 'Bearer '+tokenID
    When method POST
    Then status 201
    * print response
    * def userId = $.id
    * print userId
    # User update flow
    * def putRequest =
      """
      {
      "name":"Tom",
      "status":"active"
      }
      """
    Given path 'public/v2/users/'+userId
    And request putRequest
    And header Authorization = 'Bearer '+tokenID
    When method PUT
    Then status 200
    * print response
    And match $.id == userId
    And match $.name == "Tom"
    And match $.email == postRequest.email
