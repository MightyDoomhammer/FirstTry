require 'tokenizer/opt_parser'
require 'test/unit'
require 'optparse'

class TestOptParser < Test::Unit::TestCase

	def setup
		@opt = Tokenizer::OptParser
		@go = '-v'
		@bo = '-s'
	end
	
	def test_opt_parser_instantiable
		assert(@opt.new)
	end
	
	def test_parse
		assert_raise(NoMethodError) {@opt.new.parse(@go)}
	end
	
	def test_v
		begin
			assert(@opt.parse(@go))
		rescue SystemExit
		end
	end
	
	def test_wrong_option
		assert_raise(OptionParser::InvalidOption) {@opt.new.parse(@go)}
	end
	
	def test_public_methods
		assert_respond_to(@opt, :parse)
	end
end
	