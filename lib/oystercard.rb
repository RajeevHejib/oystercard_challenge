class Oystercard

  DEFAULT_BALANCE = 0
  MAX_BALANCE = 90
  MIN_FARE = 1

  attr_reader :balance

  def initialize(balance=DEFAULT_BALANCE)
    @balance = balance
    @in_use = false
  end

  def top_up(value)
    (balance + value) <= MAX_BALANCE ? (@balance += value) : (fail "limit of #{MAX_BALANCE} exceeded")
  end

  def touch_in
    balance < MIN_FARE ? (raise "Seek Assistance") : (@in_use = true)
  end

  def touch_out
    deduct(MIN_FARE)
    @in_use = false
  end

  def in_journey?
    @in_use
  end

  private

  def deduct(fare)
    @balance -= fare
  end

end
