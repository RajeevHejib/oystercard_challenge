require 'oystercard'

describe Oystercard do

  subject(:oystercard) { described_class.new }

  context "Balance" do

    it "Has a default of 0" do
      expect(oystercard.balance).to eq described_class::DEFAULT_BALANCE
    end

    it "Tops up the balance by a specified amount" do
      expect{ oystercard.top_up(10) }.to change{ oystercard.balance }.by(10)
    end

    it "raises an error if exceeds #MAX_BALANCE" do
      max_balance = described_class::MAX_BALANCE
      expect{ oystercard.top_up(max_balance+1) }.to raise_error "limit of #{max_balance} exceeded"
    end

    it "deducts the fare from the balance" do
      oystercard.top_up(40)
      expect{ oystercard.deduct(20) }.to change{ oystercard.balance }.by(-20)
    end

  end

  context "Journey" do

    it "Touch in will change #in_use to true" do
      oystercard.touch_in
      expect(oystercard).to be_in_journey
    end

    it "Touch out will change #in_use to false" do
      oystercard.touch_in
      oystercard.touch_out
      expect(oystercard).not_to be_in_journey
    end

  end

end
