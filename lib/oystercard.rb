class Oystercard
  MAX_VALUE = 90

  attr_reader :balance, :journeys

  def initialize
    @balance = 0
    @journeys = []
  end

  def top_up(amount)
    raise "Maximum balance of #{MAX_VALUE} exceeded" if (@balance + amount) > MAX_VALUE
    @balance += amount
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
