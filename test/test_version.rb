require 'tokenizer'
require 'test/unit'

class TestVersion < Test::Unit::TestCase
	
	def setup
		@t = Tokenizer::Tokenizer.new
	end # setup
	
	def test_version
		#assert(Tokenizer::Version.is_a?(Array),'Falsche Klasse')
		assert_equal(false, Tokenizer::Version.empty?)
	end #test_version
	
end # TestVersion