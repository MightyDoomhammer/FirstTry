require 'tokenizer/tokenizer'
require 'test/unit'

class TestTokenizer < Test::Unit::TestCase

	def setup
		@t = Tokenizer::Tokenizer.new(:de) # neue Instanz Tokenizer vor Tests (DE wegen Sprache)
		@result = @t.tokenize("string")
	end # setup

	def test_has_method
		assert(@t.respond_to?(:tokenize))
		assert_instance_of(Array, @result)
	end #test_tokenizer
	
	def test_not_empty
		assert_equal(false, @result.empty?)
	end

end