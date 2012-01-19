class Person #just an exercise for Comparable
include Comparable
attr_reader :height 

	def initialize(height)
		@height = height
	end
	
	def <=>(other)
		return 1 if self.height > other.height
		return 0 if self.height == other.height
		return -1 if self.height < other.height
	end
end
