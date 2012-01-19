class People

attr_reader :names
include Enumerable

	def initialize
		@names = []
	end

	def <<(n)
		@names << n
	end
	
	def each(&b)
		@names.each do |n|
			yield n
		end
	end
	
end #class

men = People.new
%w{a b c d}.each{|n| men << n} #n = names
men.reverse_each{|m| puts m}


#sort für People definieren