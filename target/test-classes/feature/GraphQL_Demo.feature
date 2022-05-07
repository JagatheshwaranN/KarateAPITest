Feature: Automation of GraphQL

  Scenario: Verify automation of GraphQL using post call
    Given url 'https://api.graphql.jobs/'
    And text query =
      """
      query {
        jobs{
          id, title
        }
      }
      """
    And request {query:'#(query)'}
    When method POST
    Then status 200
    And print response