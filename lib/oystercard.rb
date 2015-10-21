require_relative 'station'
require_relative 'journey'

class Oystercard

  DEFAULT_BALANCE = 0
  MAX_BALANCE = 90
  MIN_FARE = 1
  PENALTY_FARE = 6

  attr_reader :balance, :entry_station, :journey

  def initialize(balance=DEFAULT_BALANCE)
    @balance = balance
    @journey = Journey.new
  end

  def top_up(value)
    raise "limit of #{MAX_BALANCE} exceeded" if exceeded?(value)
    @balance += value
  end

  def touch_in(station)
      raise ("Seek Assistance") if insufficient_funds?
      journey.set_entry_station(station)
  end

  def touch_out(station)
    journey.list_of_journeys[:entry_station] == nil ? deduct(PENALTY_FARE) : deduct(MIN_FARE)
    journey.set_exit_station(station)
  end

  def in_journey?
    journey.check_in_use
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
