require './lib/oystercard'
require './lib/station'

# oystercard = Oystercard.new
# oystercard.top_up(15)
# puts oystercard.balance # this should puts 15
# oystercard.deduct(5)
# puts oystercard.balance # this should puts 10
# oystercard.touch_in # this should change in_journey? to true
# puts oystercard.in_journey # this should puts true
# oystercard.touch_out # this should change it back to false
# puts oystercard.in_journey # this should puts false
# puts Oystercard::MAX_VALUE # this should puts the max value we set

# # step09

# card2 = Oystercard.new
# begin
#   card2.touch_in # expect to raise error
# rescue StandardError => e
#   puts 'This is good, has raised correct error for touching in without enough money'
# else
#   puts 'This is bad, feature not written to check touch in without enough money'
# end

# # step 10

# card3 = Oystercard.new
# card3.top_up(1)
# card3.touch_in
# begin
#   card3.touch_out # expect to raise error
# rescue StandardError
#   puts 'This is good, has raised an error when tried to touch out'
# else
#   puts 'This is bad, feature not written for touch_out checks'
# end

# step 11
# puts '--  step 11 & 12 --------------------------------------------------------------'
# entry_station = 'Lambeth'
# exit_station = 'Waterloo'
#
# card4 = Oystercard.new
#
# puts card4.journeys #this should puts an empty journey
# card4.top_up(50)
# puts 'Entry station not nil on creation' unless card4.entry_station.nil?
# card4.touch_in(entry_station)
# puts 'Entry station not set on touch in' if card4.entry_station != entry_station
# card4.touch_out(exit_station)
# puts 'Entry station not cleared' unless card4.entry_station.nil?
# puts card4.journeys # this should puts my journey history
# puts '-- Step 11 & 12 complete  ----------------------------------------------------------'

# step 13
# station = Station.new("Lambeth",1)
# puts station

# step 14
journey = Journey.new
puts journey

card = Oystercard.new
card.top_up(10)
card.touch_in("Epping")
journey.complete?
journey.fare
journey.finish
