class Oystercard

  DEFAULT_BALANCE = 0
  MAX_BALANCE = 90
  attr_reader :balance

  def initialize(balance=DEFAULT_BALANCE)
    @balance = balance
  end

  def top_up(value)
    (balance + value) <= MAX_BALANCE ? (@balance += value) : (fail "limit of #{MAX_BALANCE} exceeded")
  end

end
