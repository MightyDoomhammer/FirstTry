require 'tokenizer/error'

module Tokenizer

class Tokenizer
@lang #Language
WL = /\s+/ #word limit
PRE = %w{ ( " ' [ \{ « ? ‹ ‘ ‚ “ „ ¡ ¿}
POST = %w{ ! " ] ) , . / : ; = ? ­ · » ? ; › ’ ” ' \} }

	def initialize(params = {:lang => :de})
		check_params(params)
		@abrl = new_list("#{:lang}_abbr.txt")	#returns Array
	end
#Returns the tokens contained in the given string.
	def tokenize(str)
		tokens = str.split(WL)
		tokens = sep_punct(tokens)
		tokens
	end

private

	def new_list(filename)
		f = File.open(filename, 'r') #file exists? readable? damaged?
		l = f.readlines
		f.close
		l
	end


#Check for valid parameters 
	def check_params(params)
		if !params.instance_of?(Hash)
			fail(UserError, "Die Parameter sind keine Hash-Struktur!")
		elsif params.empty?
			fail(UserError, "Die Parameter sind leer!")
		elsif !params.has_key?(:lang)
			fail(UserError, "Der Parameter \'lang\' hat keinen Wert!")
		end
	end
	
#Separate punctuation from tokens
	def sep_punct (tokens)
		out = ""
		tokens.each do |token|
			token.each_char do |c|
				if PRE.include?(c)
					out << "#{c}\n"
				elsif POST.include?(c)
					out << "\n#{c}"
				else
					out << c
				end
			end
		out << "\n"
		end
		out.split(/\n+/)
	end
end #class
end #module



# in sep_punct implementieren, dass Abkürzungen nicht der Punkt weg kommt
# test für new_list