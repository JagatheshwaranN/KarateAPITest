Feature: Hello world

  Scenario: Print Hello world
    * print 'Hello world'
    * print 'Welcome to Karate'

  Scenario: Print payload
    * def jsonObj =
      """
      {
      "name":"karate",
      "use":"testing"
      }
      """
    * print jsonObj
