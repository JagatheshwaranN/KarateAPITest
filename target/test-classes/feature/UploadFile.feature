Feature: Automation of Upload File

Scenario: Verify upload of file using Post call
Given url 'https://filebin.net/28042022/Buddha'
And header Content-type = 'image/jpg'
And request karate.read('file:src/test/resources/payload/Buddha.jpg')
When method POST
Then status 201
And print response

Scenario: Verify download of file using Get call
Given url 'https://filebin.net/28042022/Buddha'
And header Content-type = 'image/jpg'
When method GET
Then status 200
Then match response == karate.read('file:src/test/resources/payload/Buddha.jpg') 


