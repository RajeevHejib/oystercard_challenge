require_relative 'station.rb'

class Oystercard

  DEFAULT_BALANCE = 0
  MAX_BALANCE = 90
  MIN_FARE = 1

  attr_reader :balance, :entry_station, :list_of_journeys

  def initialize(balance=DEFAULT_BALANCE)
    @balance = balance
    @list_of_journeys = {}
  end

  def top_up(value)
    raise "limit of #{MAX_BALANCE} exceeded" if exceeded?(value)
    @balance += value
  end

  def touch_in(station)
      raise ("Seek Assistance") if insufficient_funds?
      @entry_station = station
      list_of_journeys[entry_station] = nil
  end

  def touch_out(station)
    deduct(MIN_FARE)
    list_of_journeys[entry_station] = station
    @entry_station = nil
  end

  def in_journey?
    entry_station != nil
  end

  private

  def deduct(fare)
    @balance -= fare
  end

  def insufficient_funds?
    balance < MIN_FARE
  end

  def exceeded?(value)
    (balance + value) >= MAX_BALANCE
  end
end
