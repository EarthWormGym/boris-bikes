require_relative 'bike'

class DockingStation
  attr_accessor :bikes, :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def list_of_bikes
    return @bikes
  end

  def release_bike
    fail "No bikes available" if empty?
    fail "No bikes available" if find_working_bike.empty?
    @bikes.pop
  end

  def find_working_bike
    @bikes.each { |e| return false if e.working? }
  end

  def dock(bike)
    fail 'Docking station full' if full?
    @bikes << bike
  end

  def full?
   @bikes.count >= capacity
  end

  def empty?
   if @bikes.length == 0
     false
   else
     true
   end
  end

end

class Van
  attr_accessor :held_bikes

  def initialize
    @held_bikes = []
  end

  def take_broken_bikes(bikes_arr)
    bikes_arr.each do |bike| @held_bikes << bike if bike.broken?
      bikes_arr.shift
    end
  end
end

class Garage
  attr_accessor :fixing_bikes

  def initialize
    @fixing_bikes = []
  end

  def store_van_bikes(stored_bikes)
      stored_bikes.each do |bike| @fixing_bikes << bike
      end
  end

  def fix_broken_bikes
    fixing_bikes.each do |bike| bike.broken = false
    end
  end

  def return_bikes(van)
    van.held_bikes = fixing_bikes
  end
end
