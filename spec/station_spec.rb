require 'station'

describe Station do

  subject(:station) { described_class.new('Victoria',  1) }

  context '#initialization' do
    it "has a name and zone attribute" do
      expect(station).to have_attributes(:name => 'Victoria', :zone => 1)
    end
  end

end
