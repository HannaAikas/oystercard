require 'journey'
require 'oystercard'

describe Journey do

  context 'user has topped up, touched in and touched out' do
    card = Oystercard.new
    before(:each) { card.top_up(10); card.touch_in("Aldgate"); card.touch_out("Ealing") }

    it 'finishes a journey' do
      expect(journeys[:entry_station]).to eq("Aldgate").and(journeys[:exit_station]).to eq("Ealing")
    end

    it 'calculates a fare' do
        expect(subject.fare).to eq 2
    end

    it 'knows if a journey is complete or not'
      expect(subject.complete?).to eq true
    end
end