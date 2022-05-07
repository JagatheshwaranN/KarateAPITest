Feature: Assert and Response Usage Automation

  Scenario: Verify the use of Assert keyword
    Given url baseURL+'public/v2/users'
    And path '20'
    When method GET
    Then status 200
    And print response
    And assert responseStatus == 200
    And print responseTime
    And assert responseTime < 2000
    And assert responseTime > 200 && responseTime < 2000
    And assert responseType == 'json'
    And print requestTimeStamp
    And print responseHeaders
    #And print responseHeaders['Content-Type'][0]
    #And match responseHeaders['Content-Type'][0] == 'application/json'
    And match header Content-Type contains 'application/json'

  #And match header Content-Type == '#(^application/json)'
  Scenario: Verify the usage of the Assert features (match == )
    Given def val = {a:1}
    When val.b = 2
    Then match val == {a:1, b:2}

  Scenario: Verify the usage of the Assert features (match != )
    Given def candy = {munch: 'bar'}
    Then match candy != {munch:'beads'}

  Scenario: Verify the usage of the Assert features (match contains)
    Given def fruits = { apple:1, banana:2, grapes:3}
    Then match fruits contains {apple:1}

  Scenario: Verify the usage of the Assert features (match contains only)
    Given def numbers = { count:[1, 2, 3]}
    Then match numbers.count contains 1
    Then match numbers.count contains [2]
    Then match numbers.count contains only [1, 2, 3]

  Scenario: Verify the usage of the Assert features (match contains any)
    Given def data = { count:[1, 2]}
    Then match data.count contains any [1, 4]
    Given def data = { a:1, b:'x'}
    Then match data contains any {b:'x', c:true}

  Scenario: Verify the usage of the Assert features (match contains deep)
    Given def data = { a:1, b:2, c:3, d:{a:1, b:2}}
    When def expected = {a:1, c:3, d:{b:2}}
    Then match data contains deep expected

  Scenario: Verify the usage of the Assert features (match !contains)
    Given def data = { jil:'1',jung:'bar',jug:'cream'}
    Then match data !contains {jung:'cream'}
    Then match data !contains {foo:'#notnull'}
    Given def val = {a:1}
    Then match val == {a:'#number', b:'#notpresent'}
    Then match val == {a:'#number', b:'##null'}
    Given def numbers = [1, 2, 3]
    Then match numbers !contains 4
    Then match numbers !contains [5,6]

  Scenario: Verify the usage of the Assert features (match each)
    Given def data = {parent:[{child:1, name:'jil'}, {child:2,name:'jung'},{child:3, name:'jug'}]}
    Then match each data.parent == {child:'#number',name:'#string'}
    Then match each data.parent contains {child:'#number'}
    Then match each data.parent contains {child:'#?_!=4'}
    Then match each data.parent contains {name:"#?_!='z'"}
    Given def isAbc = function(x) { return x=='jil' || x=='jung' || x=='jug'}
    Then match each data.parent contains {name:'#? isAbc(_)'}
    Given def isXabc = function(x) { return x.name=='jil'||x.name=='jung'||x.name=='jug'}
    Then match each data.parent == '#? isXabc(_)'

  Scenario: Verify the usage of the Assert features (Fuzzy match)
    Given def data = { name:'john', type:'LOL', id:'a9f7a56b-8d5c-455c-9d13-808461d17b91'}
    Then match data == {name:'#ignore', type:'#regex [A-Z]{3}', id:'#uuid'}
    Given def val = { foo:'bar'}
    Then match val == {foo:'#present'}
    Then match val.nope == '#notpresent'
    Given def bike = {name:'hero'}
    Then match bike == {name:'#string', model:'##string'}
    Given def collection = {a:'hello',b:null,c:null}
    When def json = {foo:'#(collection.a)',bar:'#(collection.b)', baz:'##(collection.c)'}
    Then match json == { foo:'hello',bar:null}

    
  Scenario: Verify the usage of the Assert features (Schema match)
  	Given def data = ['johny','paris']
  	Then match data == '#[]'
  	Then match data == '#[2]'
  	Then match data == '#[2] #string'
  	Then match data == '#[]?_.length==5'
  	Then match data == '#[] #string?_.length==5'
  	Then match data == '##[] #string'
  	