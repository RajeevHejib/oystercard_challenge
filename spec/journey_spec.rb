require 'journey'
describe Journey do

  subject(:journey) {described_class.new}
  let (:station) {double(:name => "Victoria") }

  context "when a user has touched in and out" do
    it "journey history will be equal to one complete journey" do
      journey.set_entry_station(station)
      journey.set_exit_station(station)
      expect(journey.history).to include(journey.list_of_journeys)
    end
  end

  context "when a user touches out but does not touch in" do
    it "journey history will contain only exit station" do
      journey.set_exit_station(station)
      expect(journey.list_of_journeys[:entry_station]).to eq(nil)
    end
  end

  context "when a user touches in but does not touch out" do
    it "journey history will contain only entry station" do
      journey.set_entry_station(station)
      incomplete_journey=journey.history.map {|h|h.values}.flatten.include?(nil)
      expect(incomplete_journey).to be_truthy
    end
  end


  it "records the entry station when touched in" do
    journey.set_entry_station(station)
    expect(journey.list_of_journeys[:entry_station]).to eq(station.name)
  end

  it "at initialize the list of journeys is empty" do
    expect(journey.list_of_journeys).to be_empty
  end

end
