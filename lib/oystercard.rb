class Oystercard
  MAX_VALUE = 90
  ERR_LOW_BALANCE = 'Error - insufficient balance'.freeze
  MIN_BALANCE = 1
  FARE = 2
  attr_reader :balance, :in_journey

  def initialize
    @balance = 0
    @in_journey = false # this is a boolean
  end

  def top_up(amount)
    raise "Maximum balance of #{MAX_VALUE} exceeded" if (@balance + amount) > MAX_VALUE

    @balance += amount
  end

  def in_journey? # this is a predicate method, returns true/false
    @in_journey
  end

  def touch_in
    raise ERR_LOW_BALANCE if @balance < MIN_BALANCE

    @in_journey = true
  end

  def touch_out
    deduct(FARE)
    @in_journey = false
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
