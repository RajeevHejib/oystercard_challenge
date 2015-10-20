require 'station'

describe Station do

  subject(:station) { described_class.new('station_name', 1) }

  it "has a name and zone attribute" do
    expect(station).to have_attributes(:name => 'station_name', :zone => 1)
  end

end
