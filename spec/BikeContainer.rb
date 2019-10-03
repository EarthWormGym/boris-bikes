
module BikeContainer
  DEFAULT_CAPACITY = 20

  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
  end
end


shared_examples_for BikeContainer do
  it 'has a default capacity when initialized' do
    expect(subject.capacity).to eq BikeContainer::DEFAULT_CAPACITY
  end
end

shared_examples_for BikeContainer do
  # other tests omitted for brevity

  describe 'capacity' do
    it 'can be overridden on initialize' do
      random_capacity = Random.rand(100)
      subject = described_class.new random_capacity
      expect(subject.capacity).to eq random_capacity
    end
  end

  describe 'add_bike' do
    it 'receives a bike' do
      subject.add_bike double :bike
      expect(subject).not_to be_empty
    end
  end
end
# broken_bike.report_broken
# docking_station.dock(broken_bike)
# van.take_broken_bikes(docking_station.bikes)
# subject.store_van_bikes(van.held_bikes)
# subject.fix_broken_bikes
# subject.return_bikes(van)
