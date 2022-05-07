Feature: Automation of Json Schema

  Scenario: Verify automation of Json Schema validation
    Given def expectedJson =
      """
      {
      		"id": '#number',
          "name": '#string',
          "email": '#ignore',
          "gender": '#string',
          "status": '#string'
      }
      """
    Given url baseURL+'public/v2/users'
    And path '2441'
    When method GET
    Then status 200
    And print response
    And match response == expectedJson

  Scenario: Verify automation of Json Schema validation using Third party library
    Given url 'https://reqres.in/api/users/2'
    When method GET
    Then status 200
    And print response
    And string expectedJsonSchema = read('file:src/test/resources/payload/dataSchema.json')
    When string jsonData = response
    And def schemaUtils = Java.type('util.SchemaUtils')
    And assert schemaUtils.isValid(jsonData, expectedJsonSchema)
