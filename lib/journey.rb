require_relative 'oystercard'

class Journey
  FARE = 2
  PENALTY_FARE = 6
  ERR_LOW_BALANCE = 'Error - insufficient balance'.freeze
  MIN_BALANCE = 1

  attr_reader  :in_journey, :entry_station

  def initialize
    @in_journey = false
    @complete = false
    @entry_station = nil
    @fare = PENALTY_FARE
  end

  def in_journey?
    !!entry_station
  end

  def complete?
    @complete
  end

  def fare
    PENALTY_FARE
  end

  def touch_in(entry_station)
    # raise ERR_LOW_BALANCE if @balance < MIN_BALANCE
    @entry_station = entry_station
    @in_journey = true
  end

  # def touch_out(exit_station)
  #   deduct(Journey::FARE)
  #   @journeys << {entry_station: entry_station, exit_station: exit_station}
  #   @entry_station = nil
  #   @in_journey = false
  # end

end
