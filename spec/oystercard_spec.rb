require 'oystercard'

describe Oystercard do
  let(:station1) { double :station1 }
  let(:station2) { double :station2 }

  it 'new card has a balance of 0' do
    expect(subject.balance).to eq 0
  end

  it 'starts off with in_journey being false' do
    expect(subject.in_journey).to eq false
  end

  it 'has no entry station on creation' do
    expect(subject.entry_station).to eq(nil)
  end

  it 'has no journeys on creation' do
    expect(subject.journeys).to eq([])
  end

  describe '#top_up' do
    it 'can top up card with amount of £5' do
      expect { subject.top_up(5) }.to change { subject.balance }.by 5
    end

    it 'fails if balance exceeds maximum value' do
      max_value = Oystercard::MAX_VALUE
      subject.top_up(max_value)
      expect { subject.top_up(rand(1..100)) }.to raise_error "Maximum balance of #{max_value} exceeded"
    end
  end

  describe '#touch_in(entry_station)' do
    it 'raises error on insufficient funds' do
      expect { subject.touch_in(station1) }.to raise_error Oystercard::ERR_LOW_BALANCE
    end
  end

  context 'user is touched in' do
    before(:each) { subject.top_up(50); subject.touch_in(station1) }

    it 'journey has started' do
      expect(subject).to be_in_journey
    end

    it 'deducts the correct amount from balance' do
      expect { subject.touch_out(station2) }.to change { subject.balance }.by -Journey::FARE
    end

    it 'has recorded entry_station' do
      expect(subject.entry_station).not_to be(nil)
    end

    context 'then completed one journey' do
      before(:each) { subject.touch_out(station2) }

      it 'journey ends' do
        expect(subject).not_to be_in_journey
      end

      it 'entry_Station back to nil' do
        expect(subject.entry_station).to eq(nil)
      end

      it 'adds a journey to journeys' do
        expect(subject.journeys.count).to eq(1)
      end

      it 'adds a specific journey to journeys' do
        expect(subject.journeys[0]).to eq(entry_station: station1, exit_station: station2)
      end
    end
  end
end
