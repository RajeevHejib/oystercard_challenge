require 'oystercard'

describe Oystercard do

  subject(:oystercard) { described_class.new }



    it "Has a default of 0" do
      expect(oystercard.balance).to eq described_class::DEFAULT_BALANCE
    end

  context "Balance" do

    before { oystercard.top_up(40) }

    it "Tops up the balance by a specified amount" do
      expect{ oystercard.top_up(10) }.to change{ oystercard.balance }.by(10)
    end

    it "raises an error if exceeds #MAX_BALANCE" do
      max_balance = described_class::MAX_BALANCE
      expect{ oystercard.top_up(max_balance) }.to raise_error "limit of #{max_balance} exceeded"
    end

  end

  context "Journey" do

    it "Touch in will change #in_use to true" do
      oystercard.top_up(5)
      oystercard.touch_in
      expect(oystercard).to be_in_journey
    end

    it "does not touch in if balance is less than #MIN_FARE" do
      expect{ oystercard.touch_in }.to raise_error "Seek Assistance"
    end

    it "Touch out will change #in_use to false" do
      oystercard.top_up(5)
      oystercard.touch_in
      oystercard.touch_out
      expect(oystercard).not_to be_in_journey
    end

    it "Touch out deducts fare from balance" do
      oystercard.top_up(5)
      oystercard.touch_in
      expect{ oystercard.touch_out }.to change{ oystercard.balance }.by(-described_class::MIN_FARE)
    end

  end

end
