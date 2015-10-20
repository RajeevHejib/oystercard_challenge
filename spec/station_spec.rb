require 'station'  # ~> LoadError: cannot load such file -- station

describe Station do

  subject(:station) { described_class.new('station_name', 1) }

  it "has a name and zone attribute" do
    expect(station).to have_attributes(:name => 'station_name', :zone => 1)
  end


end

# ~> LoadError
# ~> cannot load such file -- station
# ~>
# ~> /Users/Hamza/.rvm/rubies/ruby-2.2.1/lib/ruby/site_ruby/2.2.0/rubygems/core_ext/kernel_require.rb:54:in `require'
# ~> /Users/Hamza/.rvm/rubies/ruby-2.2.1/lib/ruby/site_ruby/2.2.0/rubygems/core_ext/kernel_require.rb:54:in `require'
# ~> /Users/Hamza/Desktop/Programming/Makers Academy/Week 2/Today/oystercard_challenge/spec/station_spec.rb:1:in `<main>'
