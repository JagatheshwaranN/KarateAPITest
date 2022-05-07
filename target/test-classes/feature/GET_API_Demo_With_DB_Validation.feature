Feature: Automation of GET API

  Background: 
    #Create DB connection with DBUtils java class
    * def config = { username: 'root', password: 'root', url: 'jdbc:mysql://127.0.0.1:3306/mydatabase', driverClassName: 'com.mysql.cj.jdbc.Driver' }
    * def DbUtils = Java.type('util.DBUtils')
    * def db = new DbUtils(config)

  Scenario: Verify automation of Get Country API and validate the response with DB data
    Given url 'http://localhost:8080/getcountry/4'
    When method GET
    Then status 302
    And print response
    And match response.countryId == 4
    When def country = db.readRow('Select * from COUNTRY where CTRY_ID=' + response.countryId)
    Then print country
    And match response.countryId == country.CTRY_ID
    And match response.countryName == country.CTRY_NAME
    
