@get
Feature: GET API Automation

  @getPositive
  Scenario: Get the user details - path param - positive
    Given url baseURL+'public/v2/users'
    And path '2586'
    When method GET
    Then status 200
    * print response
    * def jsonResponse = response
    * print jsonResponse.name
    * def actualName = jsonResponse.name
    * match actualName == "Dipali Guha"

  @getNegative
  Scenario: Get the user details - path param - negative
    Given url 'https://gorest.co.in/public/v2/users'
    And path '2'
    When method GET
    Then status 404
    * print response
    * def jsonResponse = response
    * print jsonResponse.message

  Scenario: Get the user details - query param - positive
    * def query = {id:100}
    Given url baseURL+'public/v2/users'
    And params query
    When method GET
    Then status 200
    * print response

  Scenario: Get the list of active users - query param - positive
    * def query = {status:'active'}
    Given url baseURL+'public/v1/users'
    And params query
    When method GET
    Then status 200
    * print response
    * def usersCount = response.data.length
    * match usersCount == 20

  Scenario: Get the user details - query param - negative
    * def query = {id:2}
    Given url baseURL+'public/v2/users'
    And params query
    When method GET
    Then status 200
    * print response
    * def userdetail = response
    * match userdetail == []

  Scenario: Get the user details - with headers - type 1
    Given header Content-Type = 'application/payload; charset=utf-8'
    When url baseURL+'public/v2/users'
    And path '100'
    And method GET
    Then status 200
    * print response

  Scenario: Get the user details - with headers - type 2
    * def request_headers = {Content-Type:'application/payload; charset=utf-8'}
    Given headers request_headers
    When url baseURL+'public/v2/users'
    And path '100'
    And method GET
    Then status 200
    * print response

  Scenario: Get the user details - with headers - type 3
    * configure headers = {Content-Type:'application/payload; charset=utf-8'}
    When url baseURL+'public/v2/users'
    And path '100'
    And method GET
    Then status 200
    * print response

  Scenario: Get the user details using Bearer token
    Given header Authorization = 'Bearer '+tokenID
    When url baseURL+'public/v2/users'
    And path '100'
    And method GET
    Then status 200
    * print response
