require 'tokenizer/error'

module Tokenizer

Limit = /\s+/ 
	
	class Tokenizer
	#POST = %w {" . ? ! - , ) ] : ; }
	#PRE = %w {" - ( [  }
	
	
		def initialize(params = {:spr => :de})
			#@spr = spr				
			check_params(params)
		end
	puts "Tokenizer running..."
	
		def tokenize(str)
			tokens = []
			tokens = str.split(Limit) #wordlimit
			tokens = sep.punct(tokens)
			return tokens
		end
	
		private
	
		def check_params(params)	#checking correctness of parameters
			if !params.instance_of?(Hash)
				fail(UserError, "Die Parameter sind keine Hash-Struktur!")
			elsif params.empty?
				fail(UserError, "Die Parameter sind leer!")
			elsif !params.has_key?(:spr)
				fail(UserError, "Der Parameter \'lang\' hat keinen Wert!")
			end
		end
		
		def sep_punct(tokens)	#Satzzeichen abtrennen
			output = ''
			fields = str.split(token)
			  tokens.each do |words|
				words.each_char do |ch|
					if POST.include?(ch)
						output << "\n#{ch}"
					elsif PRE.include?(ch)
						output << "#{ch}\n"
					else
						output << ch
					end
				end
				output << "\n"
			  end
			output.split("\n")
		end
	end
	
end