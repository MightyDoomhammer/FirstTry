module Tokenizer
	
	class Tokenizer
		def initialize(spr = :de)
			@spr = spr				
		end
	puts "Noob mode activated"
	
		def tokenize(str)
			tokens = []
			tokens = str.split
			return tokens
		end

	end
	
end