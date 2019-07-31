require './lib/oystercard'

oystercard = Oystercard.new
oystercard.top_up(15)
puts oystercard.balance # this should puts 15
oystercard.deduct(5)
puts oystercard.balance # this should puts 10
oystercard.touch_in # this should change in_journey? to true
puts oystercard.in_journey # this should puts true
oystercard.touch_out # this should change it back to false
puts oystercard.in_journey # this should puts false
puts Oystercard::MAX_VALUE # this should puts the max value we set
