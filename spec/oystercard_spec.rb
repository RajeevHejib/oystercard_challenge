require 'oystercard'

describe Oystercard do

  subject(:oystercard) { described_class.new }

  it "balance has a default of 0" do
    expect(oystercard.balance).to eq described_class::DEFAULT_BALANCE
  end

end
