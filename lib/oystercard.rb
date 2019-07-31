class Oystercard

  MAX_VALUE = 90
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
    @in_journey = true
  end
  def touch_out
    @in_journey = false
  end

end
