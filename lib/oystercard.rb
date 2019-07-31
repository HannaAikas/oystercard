class Oystercard

  MAX_VALUE = 90
  ERR_LOW_BALANCE = "Error - insufficient balance"
  MIN_BALANCE = 1
  attr_reader :balance, :in_journey

  def initialize
    @balance = 0
    @in_journey = false # this is a boolean
  end
  def top_up(amount)
    fail "Maximum balance of #{MAX_VALUE} exceeded" if (@balance + amount) > MAX_VALUE
    @balance += amount
  end
  def deduct(amount)
    @balance -= amount
  end
  def in_journey? # this is a predicte method, returns true/false
    @in_journey
  end
  def touch_in
    fail ERR_LOW_BALANCE if @balance < MIN_BALANCE
    @in_journey = true
  end
  def touch_out
    @in_journey = false
  end

end
