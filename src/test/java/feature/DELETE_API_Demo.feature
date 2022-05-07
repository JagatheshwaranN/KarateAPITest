 Feature: Delete API Automation

  Scenario: Delete user using Delete call
    Given url baseURL+'public/v2/users/'
    And header Authorization = 'Bearer '+tokenID
    And path '2'
    When method DELETE
    Then status 204
    * print response
