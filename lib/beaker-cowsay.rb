require 'stringify-hash'
require 'beaker-cowsay/cowsay'
require 'beaker-cowsay/version'


# Boilerplate DSL inclusion mechanism:
# First we register our module with the Beaker DSL
Beaker::DSL.register( Beaker::DSL::Cowsay )
# Then we have to re-include our amended DSL in the TestCase,
# because in general, the DSL is included in TestCase far
# before test files are executed, so our amendments wouldn't
# come through otherwise
Beaker::TestCase.class_eval { include Beaker::DSL }
