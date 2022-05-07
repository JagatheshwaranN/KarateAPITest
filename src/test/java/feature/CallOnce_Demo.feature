Feature: Call Once Feature Automation

  Scenario: Verify automation of call once
    * table users
      | name   |
      | 'Bob'  |
      | 'Wild' |
    * def result = callonce read('POST_API_Demo_For_CallOnce.feature') users
    * def created = $result[*].response
    * match each created == { id:'#present', name: '#string', email: '#string', gender:'#string', status:'#string'}
    * match created[*].name contains only ['Bob', 'Wild']
