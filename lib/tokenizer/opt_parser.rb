require 'optparse'
require 'tokenizer/version'

module Tokenizer
	class OptParser 

		LTYPE = ["de", "en", "sp"]

		def OptParser.parse(args)
			@@options = {:lang => :de, :lines =>[]}
			begin
			parser = create_parser   #OptParser.create_parser returns the same
			parser.parse(args)
			rescue OptionParser::InvalidArgument
			rescue OptionParser::InvalidOption => e
				STDERR.puts "#{e.message} ist keine gueltige Erweiterung. Uebersicht der Erweiterungen mit -h"
				exit 1
			@@options
			end
		end

		private 
		
		def OptParser.create_parser
			OptionParser.new do |args|
				args.banner = 'Usage: tokenize ARGS'
				args.on('-h', '--help', 'show this summary') do #for help information
					puts args; exit
					end
				args.on('-v', '--version', 'show version') do #Version information
					puts "Current tokenizer version: #{Version}"; exit
					end
				
				args.on('-f', '--file filename', 'enter filename') do |filename|
					fileP = File.expand_path(filename)
					if File.exist?(fileP)
						if File.readable?(fileP)
							puts "File loaded \'#{fileP}\'"
							puts "Tokenization in progress"
							File.open(fileP) do |file|
							@@options[:lines] = filename.readlines
							end
						else
							STDERR.puts "Cannot read file"
						end
					else
						STDERR.puts "File not found"
					end
				end
				args.on('-l', '--lang[LANG]', LTYPE, 'language') do 
					@@options[:lang] = lang_to_sym
				end
			end
		end # def OptParser 
	end # Klasse
end # modul