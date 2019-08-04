require_relative 'oystercard'

class Journey
  FARE = 2
  PENALTY_FARE = 6
  ERR_LOW_BALANCE = 'Error - insufficient balance'.freeze
  MIN_BALANCE = 1

  attr_reader  :entry_station

  def initialize
    @complete = false
    @entry_station = nil
    @fare = PENALTY_FARE
  end

  def complete?
    @complete
  end

  def check_fare
    @fare
  end

  def touch_in(entry_station)
    # raise ERR_LOW_BALANCE if @balance < MIN_BALANCE
    @entry_station = entry_station
  end

  def touch_out(exit_station)
  #   deduct(Journey::FARE)
  #   @journeys << {entry_station: entry_station, exit_station: exit_station}
    @entry_station = nil
    @fare = FARE
    @complete = true
  end

end
