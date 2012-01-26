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
	
	def <=>(other)
		return 1 if @names > other.names
		return -1 if @names < other.names
		return 0 
	end
	
end #class

men = People.new
%w{a c d b}.each{|n| men << n} #n = names
men.reverse_each{|m| puts m}
puts
puts men.sort
