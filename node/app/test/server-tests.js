(function() {
  var nodeunit;
  nodeunit = require('nodeunit');
  exports['Connect to server'] = nodeunit.testCase({
    'Connect': function() {
      test.equal('a', 'a');
      return test.done();
    }
  });
}).call(this);
