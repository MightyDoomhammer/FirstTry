require 'tokenizer/error'

module Tokenizer

Limit = /\s+/ 
	
	class Tokenizer
		def initialize(params = {:spr => :de})
			#@spr = spr				
			check_params(params)
		end
	puts "Tokenizer running..."
	
		def tokenize(str)
			tokens = []
			tokens = str.split(Limit)
			return tokens
		end
	
		private
	
		def check_params(params)
			if !params.instance_of?(Hash) || params.empty? ||  !params.has_value?(:spr)
				fail(UserError, "Die Parameter sind falsch")
			end
		end
	end
	
end