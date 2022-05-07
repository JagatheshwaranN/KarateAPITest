Feature: Data Driven Approach Automation

  Scenario: Create new user using post call by DD
    * table users
      | name   | email                  |
      | 'Bob'  | '2304202205@gmail.com' |
      | 'Wild' | '2304202206@gmail.com' |
    * def result = call read('POST_API_Demo_Using_DD.feature') users
    * def created = $result[*].response
    * match each created == { id:'#present', name: '#string', email: '#string', gender:'#string', status:'#string'}
    * match created[*].name contains only ['Bob', 'Wild']
