Feature: API CRUD operation automation

  Background: 
    * url baseURL
    * def randomString =
      """
      function(s){
      var text = "";
      var pattern = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
      for(var i=0;i<s;i++){
      text += pattern.charAt(Math.floor(Math.random()*pattern.length()));
      }
      return text;
      }
      """
    * def postRequest =
      """
      {
        "name": "Tom Cruse",
      	"gender": "male",
      	"status": "inactive"
      }

      """
    * def randomStr = randomString(10)
    * set postRequest.email = randomStr+"@gmail.com"
    * print postRequest

  Scenario: Create user, then get the user, then update the user and then delete the user using post, get, put and delete calls
    #Create user using post call
    Given path '/public/v2/users'
    And request postRequest
    And header Authorization = 'Bearer '+tokenID
    When method POST
    Then status 201
    * print response
    * def userId = $.id
    #Get user using get call
    Given url baseURL+'/public/v2/users/'+userId
    And header Authorization = 'Bearer '+tokenID
    When method GET
    Then status 200
    * print response
    #Update user using post call
    * def putRequest =
      """
      {
      	"name":"Tom",
      	"status":"active"
      }
      """
    Given url baseURL+'/public/v2/users/'+userId
    And request putRequest
    And header Authorization = 'Bearer '+tokenID
    When method PUT
    Then status 200
    * print response
    #Delete user using delete call
    Given url baseURL+'public/v2/users/'+userId
    And header Authorization = 'Bearer '+tokenID
    When method DELETE
    Then status 204
