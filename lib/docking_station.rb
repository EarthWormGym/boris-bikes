require_relative "bike"
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
    fail "No bikes available" if broken?
    @bikes.pop
  end

  def dock(bike)
    fail 'Docking station full' if full?
    @bikes << bike
  end

  def full?
   @bikes.count >= capacity
  end

  def empty?
   @bikes.empty?
  end

end
