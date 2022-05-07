Feature: PUT API Automation

  Background: 
    * url baseURL
    * def requestPayload =
      """
      {
        "id": 30,
        "name": "Anandamayi Varrier",
        "email": "anandamayi_varrier@baumbach.com",
        "gender": "male",
        "status": "active"
      }
      """

  Scenario: Update existing user using put call
    Given path 'public/v2/users/30'
    And request requestPayload
    And header Authorization = 'Bearer '+tokenID
    When method PUT
    Then status 200
    * print response
    And match $.id == 30
    And match $.name == 'Anandamayi Varrier'
