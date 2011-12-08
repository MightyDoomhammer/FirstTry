module Tokenizer

Limit = /\s+/ 
	
	class Tokenizer
		def initialize(spr = :de)
			@spr = spr				
		end
	puts "Tokenizer running..."
	
		def tokenize(str)
			tokens = []
			tokens = str.split(Limit)
			return tokens
		end

	end
	
end