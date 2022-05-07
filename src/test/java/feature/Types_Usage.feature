Feature: Types Usage Automation

  Scenario: Verify the usage of the Types features (Str to Integer)
    Given def val = '10'
    When string json = {bar:'#(parseInt(val))'}
    Then match json == '{"bar":10}'
    When string json = {bar:'#(1*val)'}
    Then match json == '{"bar":10}'
    When string json = {bar:'#(~~val)'}
    Then match json == '{"bar":10}'

  Scenario: Verify the usage of the Types features (Str to Float)
    Given def val = '100'
    When string json = {bar:'#(val*0.1)'}
    Then match json == '{"bar":10.0}'
    When string json = {bar:'#(~~(val*0.1))'}
    Then match json == '{"bar":10}'

  Scenario: Verify the usage of the Types features (Str to Large Number)
    Given def big = 123123123123
    When string json = {num:'#(big)'}
    Then match json == '{"num":1.23123123123E11}'
    Given def big = new java.math.BigDecimal(123123123123)
    When string json = {num:'#(big)'}
    Then match json == '{"num":123123123123}'

  Scenario: Verify the usage of the Types feature (JsonPath Filters)
    Given def bike =
      """
      {
      type:'2wheeler',
      collection:[
      {brand:'Hero',model:'Splender'},
      {brand:'Bajaj',model:'Pulser'}]
      }
      """
    * def bob = get[0] bike.collection[?(@.brand=='Hero')]
    * match bob.model == 'Splender'
    * def temp = karate.jsonPath(bike,"$.collection[?(@.model=='"+bob.model+"')]")
    * match temp[0] == bob
    * def temp = karate.jsonPath(bike,"$.collection[?(@.model=='"+bob.model+"')]")[0]
    * match temp == bob

  Scenario: Verify the usage of the Types feature (Karate map operation)
    Given def fun = function(x){return x * x}
    When def list = [1, 2, 3]
    And def result = karate.map(list, fun)
    Then match result == [1, 4, 9]

  Scenario: Verify the usage of the Types feature (Karate map operation)
    Given def before = [{circle:1}, {circle:2}]
    When def fun = function(x){ return { square:x.circle}}
    And def after = karate.map(before, fun)
    Then match after == [{square:1},{square:2}]

  Scenario: Verify the usage of the Types feature (Karate map operation)
    Given def list = ['john','alex']
    When def data = karate.mapWithKey(list,'name')
    Then match data == [{name:'john'},{name:'alex'}]

  Scenario: Verify the usage of the Types feature (Karate filter operation)
    Given def list = [1, 2, 3, 4]
    When def fun = function(x){ return x%2==0}
    Then def result = karate.filter(list,fun)
    And match result == [2, 4]

  Scenario: Verify the usage of the Types feature (Karate forEach operation)
    Given def keys = []
    And def vals = []
    And def pos = []
    Given def fun =
      """
      function(x, y, z){
      karate.appendTo(keys,x);
      karate.appendTo(vals,y);
      karate.appendTo(pos,z);
      }
      """
    Given def map = {a:2, b:4, c:6}
    When karate.forEach(map,fun)
    Then match keys == ['a', 'b', 'c']
    Then match vals == [2, 4, 6]
    Then match pos == [0, 1 , 2]

  Scenario: Verify the usage of the Types feature (Karate filterKeys operation)
    Given def schema = {a:'#string',b:'#number',c:'#boolean'}
    And def response = {a:'apple',c:true}
    When match response == karate.filterKeys(schema,response)
    Then match karate.filterKeys(response, 'b', 'c') == {c:true}
    Then match karate.filterKeys(response, ['a','b']) == { a: 'apple'}

  Scenario: Verify the usage of the Types feature (Karate merge operation)
    Given def list = {a:1}
    When def list1 = karate.merge(list,{b:2})
    Then match list1 == {a:1, b:2}

  Scenario: Verify the usage of the Types feature (Karate append operation)
    Given def list = [{a:1}]
    When def list1 = karate.append(list,[{b:2}])
    Then match list1 == [{a:1}, {b:2}]

  Scenario: Verify the usage of the Types feature (Karate sort operation)
    Given def list = [{a:{b:2}},{a:{b:1}}]
    When def fun = function(x) { return x.a.b }
    And def list1 = karate.sort(list,fun)
    Then match list1 == [{a:{b:1}},{a:{b:2}}]
    Then match list1.reverse() == [{a:{b:2}},{a:{b:1}}]
    
 Scenario: Verify the usage of the Types feature (Karate loop operation)
 		Given def fun = function(i){ return i * 2 }
 		When def val = karate.repeat(5, fun)
 		Then match val == [0, 2, 4, 6, 8]
 		Given def val1 = []
 		And def fun = function(i){ karate.appendTo(val1, i) }
 		When karate.repeat(5,fun)
 		Then match val1 == [0,1,2,3,4]
 		Given def val2 = karate.range(4,9)
 		Then match val2 == [4, 5, 6, 7, 8, 9]	
 
