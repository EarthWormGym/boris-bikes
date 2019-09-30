require "docking_station"

describe DockingStation do
  xit "repsonds to release_bike" do
    expect(subject).to respond_to :release_bike
  end

  xit { is_expected.to respond_to(:bike) }

  describe '#release_bike' do
    xit 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      # we want to release the bike we docked
      expect(subject.release_bike).to eq bike
    end
  end
  describe '#release_bike' do
  xit 'raises an error when there are no bikes available' do
    # Let's not dock a bike first:
    # remember subject == DockingStation.new
    expect { subject.release_bike }.to raise_error 'No bikes available'
  end
  end
   describe '#dock' do
     xit 'raises an error when full' do
      subject.capacity.times { subject.dock Bike.new }
       expect { subject.dock Bike.new}.to raise_error 'Docking station full'
     end
     end
   end
   describe DockingStation do
     xit 'Has default capacity' do
     expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
   end
 end
   describe 'initialization' do
    it 'has a variable capacity' do
    docking_station = DockingStation.new(50)
    50.times { docking_station.dock Bike.new }
    expect{ docking_station.dock Bike.new }.to raise_error 'Docking station full'
 end
end
