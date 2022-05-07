Feature: Automation of Data Driven Scenarios

  Scenario Outline: Name is <name> and Age is <age>
    Given def temp = '<name>'
    Then match temp == name
    And match temp == __row.name
    * print __row.name
    And def expected = __num == 0 ? 'Name is John and Age is 5' : 'Name is Alex and Age is 6'
    * print __num
    And match expected == karate.scenario.name
    * print karate.scenario.name

    Examples: 
      | name | age |
      | John |   5 |
      | Alex |   6 |

  Scenario Outline: Data driven magic var with type hint
    Given def expected = [{name:'John',age:5},{name:'Alex',age:6}]
    Then match __row == expected[__num]

    Examples: 
      | name | age! |
      | John |    5 |
      | Alex |    6 |

  Scenario Outline: Data driven magic var with Inline json
    Given def data = { first:'hello',second:{bar:'world'}}
    Then match first == 'hello'
    Then match second == {bar:'world'}

    Examples: 
      | first | second!       |
      | hello | {bar:'world'} |

  Scenario Outline: Name is ${name.first} ${name.last} and Age is ${age}
    * match name.first == "#? _=='John'|| _=='Alex'"
    * match name.last == "#? _=='Peter'|| _=='Jeff'"
    * match title == karate.scenario.name

    Examples: 
      | name!                       | age | title                           |
      | {first:'John',last:'Peter'} |   5 | Name is John Peter and Age is 5 |
      | {first:'Alex',last:'Jeff'}  |   6 | Name is Alex Jeff and Age is 6  |
