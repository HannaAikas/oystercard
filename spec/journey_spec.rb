require 'journey'
require 'oystercard'

describe Journey do

  context 'user has topped up, touched in and touched out' do
    card = Oystercard.new
    before(:each) { card.top_up(10); card.touch_in("Aldgate"); card.touch_out("Ealing") }
  

    it 'calculates a fare' do
      expect(subject.fare).to eq 2
    end

    it 'knows if a journey is complete or not' do
      expect(subject).not_to be_complete
    end
  end
end
