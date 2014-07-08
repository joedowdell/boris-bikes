module BikeContainer

	DEFAULT_CAPACITY = 10

	def bikes
		@bikes ||= []
	end

	def capacity
		@capacity ||= DEFAULT_CAPACITY
	end

	def capacity=(value)
		@capacity = value
	end

	def bike_count
		bikes.count
	end

	def dock(bike)
		raise "Container is full" if full?
		bikes << bike
	end

	def release(bike)
		raise "Argument is not a bike" unless bike.is_a?(Bike)
		raise "Container is empty" if self.empty?
		raise "Bike is not in the container" unless bikes.include?(bike)
		bikes.delete(bike)
	end

	def full?
		bike_count == capacity
	end

	def empty?
		bike_count == 0
	end

	def available_bikes
		bikes.reject {|bike| bike.broken? }
	end

end