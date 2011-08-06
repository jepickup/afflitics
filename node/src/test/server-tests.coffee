nodeunit = require 'nodeunit'

exports['Connect to server'] = nodeunit.testCase
	'Connect': (test) ->
		test.equal 'a', 'a'
		test.done()