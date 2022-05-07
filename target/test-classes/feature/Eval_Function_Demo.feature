Feature: Automation of Eval functionality

  Scenario: Verify automation of Eval functionality
    Given eval
      """
      var data = function(x) { return x * x}
      var nums = [0, 1, 2, 3, 4]
      var square = []
      for ( var n in nums){
      square.push(data(n));
      }
      karate.set('temp',square);
      """
    Then match temp == [0, 1, 4, 9, 16]
