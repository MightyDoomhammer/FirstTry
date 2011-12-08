require 'optparse'
require 'tokenizer/version'
module Tokenizer
class OptParser 

	def OptParser.parse(args)
		@@options = {}
		begin
		parser = create_parser   #OptParser.create_parser liefert dasselbe
		parser.parse(args)
		rescue OptionParser::InvalidArgument
		rescue OptionParser::InvalidOption => e
			STDERR.puts "#{e.message} ist keine gueltige Erweiterung. Uebersicht der Erweiterungen mit -h"
			exit 1
		end
	end

	private 
	
	def OptParser.create_parser
		OptionParser.new do |args|
		args.banner = 'Usage: tokenize ARGS'
		args.on('-h', '--help', 'show this summary') do #für help informationen
			puts args; exit
			end
		args.on('-v', '--version', 'show version') do #Versionsinformation
			puts "Current tokenizer version: #{Version}"; exit
			end
		end
	end
end
end