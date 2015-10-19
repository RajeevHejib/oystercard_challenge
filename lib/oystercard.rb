class Oystercard

  DEFAULT_BALANCE = 0
  MAX_BALANCE = 90
  attr_reader :balance

  def initialize(balance=DEFAULT_BALANCE)
    @balance = balance
    @in_use = false
  end

  def top_up(value)
    (balance + value) <= MAX_BALANCE ? (@balance += value) : (fail "limit of #{MAX_BALANCE} exceeded")
  end

  def deduct(fare)
    @balance -= fare
  end

  def touch_in
    @in_use = true
  end

  def touch_out
    @in_use = false
  end

  def in_journey?
    @in_use
  end

end
