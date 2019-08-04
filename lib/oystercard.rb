class Oystercard
  MAX_VALUE = 90
  ERR_LOW_BALANCE = 'Error - insufficient balance'.freeze
  MIN_BALANCE = 1

  attr_reader :balance, :in_journey, :entry_station, :journeys

  def initialize
    @balance = 0
    @in_journey = false
    @entry_station = nil
    @journeys = []
  end

  def top_up(amount)
    raise "Maximum balance of #{MAX_VALUE} exceeded" if (@balance + amount) > MAX_VALUE

    @balance += amount
  end

  def in_journey? # this is a predicate method, returns true/false
    !!entry_station
  end

  def touch_in(entry_station)
    raise ERR_LOW_BALANCE if @balance < MIN_BALANCE

    @entry_station = entry_station
    @in_journey = true
  end

  def touch_out(exit_station)
    deduct(Journey::FARE)
    @journeys << {entry_station: entry_station, exit_station: exit_station}
    @entry_station = nil
    @in_journey = false
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
