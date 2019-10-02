require "docking_station"

describe DockingStation do
  it "repsonds to release_bike" do
    expect(subject).to respond_to :release_bike
  end

  it { is_expected.to respond_to(:bikes) }

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


describe Van do
  it 'takes the bikes' do
    #Arrange
    broken_bike = Bike.new
    docking_station = DockingStation.new
    #Act
    broken_bike.report_broken
    docking_station.dock(broken_bike)
    subject.take_broken_bikes(docking_station.bikes)
    #Assert
    expect(subject.held_bikes).to include(broken_bike)
  end
  it 'docks fixed bikes' do
    #Arrange
    broken_bike = Bike.new
    docking_station = DockingStation.new
    garage = Garage.new
    #Act
    broken_bike.report_broken
    docking_station.dock(broken_bike)
    subject.take_broken_bikes(docking_station.bikes)
    garage.store_van_bikes(subject.held_bikes)
    garage.fix_broken_bikes
    garage.return_bikes(subject)
    subject.held_bikes.each do |bike|
      docking_station.dock(bike)
    end
    expect(docking_station.bikes).to eq(subject.held_bikes)
  end
end

describe Garage do
  # before(:all) do
  #   #Arrange
  #   broken_bike = Bike.new
  #   docking_station = DockingStation.new
  #   van = Van.new
  #   #Act
  #   broken_bike.report_broken
  #   docking_station.dock(broken_bike)
  #   van.take_broken_bikes(docking_station.bikes)
  #   subject.store_van_bikes(van.held_bikes)
  #end
  it 'receives broken bikes' do
    #Arrange
    broken_bike = Bike.new
    docking_station = DockingStation.new
    van = Van.new
    #Act
    broken_bike.report_broken
    docking_station.dock(broken_bike)
    van.take_broken_bikes(docking_station.bikes)
    subject.store_van_bikes(van.held_bikes)
    #Assert
    expect(subject.fixing_bikes).to eq(van.held_bikes)
  end

  it 'fixing bikes' do
    #Arrange
    broken_bike = Bike.new
    docking_station = DockingStation.new
    van = Van.new
    #Act
    broken_bike.report_broken
    docking_station.dock(broken_bike)
    van.take_broken_bikes(docking_station.bikes)
    subject.store_van_bikes(van.held_bikes)
    subject.fix_broken_bikes
    subject.fixing_bikes.each do |bike|
      expect(bike.broken?).to_not eq(true)
    end
  end

  it 'returns fixed bikes to the van' do
    #Arrange
    broken_bike = Bike.new
    docking_station = DockingStation.new
    van = Van.new
    #Act
    broken_bike.report_broken
    docking_station.dock(broken_bike)
    van.take_broken_bikes(docking_station.bikes)
    subject.store_van_bikes(van.held_bikes)
    subject.fix_broken_bikes
    subject.return_bikes(van)

    expect(van.held_bikes).to eq(subject.fixing_bikes)
  end
end
