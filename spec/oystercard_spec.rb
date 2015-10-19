require 'oystercard'

describe Oystercard do

  subject(:oystercard) { described_class.new }

  it "balance has a default of 0" do
    expect(oystercard.balance).to eq described_class::DEFAULT_BALANCE
  end

  it "tops up the balance by a specified amount" do
    expect{ oystercard.top_up(10) }.to change(oystercard, :balance).by(10)
  end

end
