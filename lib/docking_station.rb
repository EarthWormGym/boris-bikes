require_relative 'bike'

class DockingStation
  attr_accessor :bike
  attr_accessor :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity)
    @capacity = capacity
    @bikes = []
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
