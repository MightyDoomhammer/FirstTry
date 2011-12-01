require 'optparse'

class OptParser 

	def OptParser.parse(args)
		@@options = {}
		parser = create_parser   #OptParser.create_parser liefert dasselbe
		parser.parse(args)
	end

	private 
	
	def OptParser.create_parser
		OprionParser.new do |args|
		args.banner = 'Usage: tokenize ARGS'
		args.on('-h', '--help', 'showthissummary') do 
			puts args; exit
			end
		end
	end
end