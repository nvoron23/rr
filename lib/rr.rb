dir = File.dirname(__FILE__)

require "rr/double"

require "rr/mock_creator"
require "rr/stub_creator"
require "rr/probe_creator"
require "rr/do_not_allow_creator"

require "rr/scenario"
require "rr/space"

require "rr/errors/rr_error"
require "rr/errors/scenario_not_found_error"
require "rr/errors/scenario_order_error"
require "rr/errors/argument_equality_error"
require "rr/errors/times_called_error"

require "rr/expectations/argument_equality_expectation"
require "rr/expectations/any_argument_expectation"
require "rr/expectations/times_called_expectation"

require "rr/wildcard_matchers/anything"
require "rr/wildcard_matchers/is_a"
require "rr/wildcard_matchers/numeric"
require "rr/wildcard_matchers/boolean"
require "rr/wildcard_matchers/duck_type"
require "rr/wildcard_matchers/regexp"
require "rr/wildcard_matchers/range"

require "rr/times_called_matchers/times_called_matcher"
require "rr/times_called_matchers/any_times_matcher"
require "rr/times_called_matchers/integer_matcher"
require "rr/times_called_matchers/range_matcher"
require "rr/times_called_matchers/proc_matcher"
require "rr/times_called_matchers/at_least_matcher"
require "rr/times_called_matchers/at_most_matcher"

require "rr/extensions/double_methods"
