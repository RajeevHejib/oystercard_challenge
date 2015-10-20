require 'oystercard'
require 'station'

describe Oystercard do

  subject(:oystercard) { described_class.new }

  let(:station1) { double(:station, :name => 'stationA', :zone => 1) }
  let(:station2) { double(:station, :name => 'stationB', :zone => 2) }

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

    before { oystercard.top_up(40) }

    it "Touch in will set #in_journey? to true" do
      oystercard.touch_in(station1)
      expect(oystercard).to be_in_journey
    end

    it "does not touch in if balance is less than #MIN_FARE" do
      card=Oystercard.new
      expect{ card.touch_in(station1) }.to raise_error "Seek Assistance"
    end

    it "Touch out will forget the entry station" do
      oystercard.touch_in(station1)
      oystercard.touch_out(station2)
      expect(oystercard).not_to be_in_journey
    end

    it "Touch out deducts fare from balance" do
      oystercard.touch_in(station1)
      expect{ oystercard.touch_out(station2) }.to change{ oystercard.balance }.by(-described_class::MIN_FARE)
    end

    it "records the entry station when touched in" do
      oystercard.touch_in(station1)
      expect(oystercard.entry_station).to eq station1
    end

    it "at initialize the list of journeys is empty" do
      expect(oystercard.list_of_journeys).to be_empty
    end

    it "Touch in and touch out will create one journey" do
      oystercard.touch_in(station1)
      oystercard.touch_out(station2)
      expect(oystercard.list_of_journeys).not_to be_empty
    end

    it "#list_of_journeys contains the zone number" do
      oystercard.touch_in(station1)
      oystercard.touch_out(station2)
      expect(oystercard.list_of_journeys[station1].zone).to eq 2
    end

  end

end
