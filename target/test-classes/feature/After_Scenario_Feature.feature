Feature: Automation of After Scenario and After Feature

Background:
* configure afterScenario = 
"""
function(){
var info = karate.info;
karate.log('After Scenario: ', info.scenarioName);
}
"""

* configure afterFeature = 
"""
function(){
var info = karate.info;
karate.log('After Feature: ', info.featureFileName);
}
"""

Scenario: print Apple
Given def data = 'Apple'
Then print data


Scenario: print Banana
Given def data = 'Banana'
Then print data

