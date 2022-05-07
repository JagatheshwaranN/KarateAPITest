Feature: Automation of Karate's advanced features

  Scenario: Verify automation of If Then Else condition
    Given def data = 10
    When def data1 = data == 10 ? data1 = 5: data1=10
    Then match data1 == 5

  Scenario: Verify automation of Json Lookup
    Given def data =
      """
      {
      foo:'hello',
      bar:'world'
      }
      """
    When def key = 'bar'
    Then match (data[key]) == 'world'

  Scenario: Verify automation of karate abort
    Given def response = 404
    When if (response == 404) karate.abort()
    Then print response

  Scenario: Verify automation of Karate fail
    Given def response = 404
    When if (response == 404) karate.fail('Scenario failed !!')
