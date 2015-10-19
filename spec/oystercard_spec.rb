require 'oystercard'

describe Oystercard do

  subject(:oystercard) { described_class.new }

  it "balance has a default of 0" do
    expect(oystercard.balance).to eq described_class::DEFAULT_BALANCE
  end

  it "tops up the balance by a specified amount" do
    expect{ oystercard.top_up(10) }.to change(oystercard, :balance).by(10)
  end

  it "raises an error if balance were to exceed #MAX_BALANCE" do
    max_balance = described_class::MAX_BALANCE
    expect{ oystercard.top_up(max_balance+1) }.to raise_error "limit of #{max_balance} exceeded"
  end

end
