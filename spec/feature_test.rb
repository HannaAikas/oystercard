require './lib/oystercard'

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
puts '--  step 11  ------------------------------------------------------------------'
station = 'Lambeth'

card4 = Oystercard.new

card4.top_up(50)
puts 'Entry station not nil on creation' unless card4.entry_station.nil?
card4.touch_in(station)
puts 'Entry station not set on touch in' if card4.entry_station != station
card4.touch_out
puts 'Entry station not cleared' unless card4.entry_station.nil?
puts '-- Step 11 complete  ----------------------------------------------------------'
