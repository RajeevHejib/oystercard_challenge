require 'station'

describe Station do

  subject(:station) { described_class.new('Victoria') }

  context '#initialization' do
    it "has a name and zone attribute" do
      expect(station).to have_attributes(:name => 'Victoria', :zone => 1)
    end
  end

  it "raises an error if an invalid station name is entered" do
    expect{Station.new('Wimbledon')}.to raise_error "Invalid station"
  end

end
