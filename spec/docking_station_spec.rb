require "docking_station"

describe DockingStation do
  it "repsonds to release_bike" do
    expect(subject).to respond_to :release_bike
  end

  it { is_expected.to respond_to(:bike) }

  describe '#release_bike' do
    it 'releases a bike' do
      bike = double(:bike, broken?: false)
      subject.dock(bike)
      # we want to release the bike we docked
      expect(subject.list_of_bikes.count >= 1)
    end
  end
  describe '#release_bike' do
  it 'raises an error when there are no bikes available' do
    # Let's not dock a bike first:
    # remember subject == DockingStation.new
    expect { subject.release_bike }.to raise_error 'No bikes available'
  end
  end
   describe '#dock' do
     it 'raises an error when full' do
      subject.capacity.times { subject.dock double(:bike, broken?: false) }
       expect { subject.dock double(:bike)}.to raise_error 'Docking station full'
     end
     end
   end
   describe DockingStation do
     it 'Has default capacity' do
     expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
   end
 end
   describe 'initialization' do
    it 'has a variable capacity' do
    docking_station = DockingStation.new(50)
    50.times { docking_station.dock double(:bike, broken?: false) }
    expect { docking_station.dock double(:bike) }.to raise_error(RuntimeError)
 end
end
    describe "#release_bike" do
    it "wont return broken bikes" do
    docking_station = DockingStation.new(50)
    bike = double(:bike, broken?: true)
    expect { docking_station.release_bike }.to raise_error 'No bikes available'
  end
end
