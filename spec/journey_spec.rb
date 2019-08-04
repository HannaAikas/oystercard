require 'journey'

describe Journey do
  let(:station1) { double ('entry station') }
  let(:station2) { double ('exit station') }

  context 'before starting a journey' do
    it 'shows whether journey is complete' do
      expect(subject).not_to be_complete
    end
    it 'shows the penalty fare as the default fare' do
      expect(subject.check_fare).to eq Journey::PENALTY_FARE
    end
    it 'is able to start the journey by touching in' do
      expect(subject).to respond_to :touch_in
    end
  end

  context 'once user has touched in' do
    before(:each) do
      subject.touch_in(station1)
    end

    it 'still shows the penalty fare as the fare because touch out has not happened' do
      expect(subject.check_fare).to eq Journey::PENALTY_FARE
    end
    it 'knows the entry station' do
      expect(subject.entry_station).to eq station1
    end

    context 'once user finishes journey' do
      before(:each) do
        subject.touch_out(station2)
      end

      it 'sets the fare to normal rate' do
        expect(subject.check_fare).to eq Journey::FARE
      end
      it 'knows the journey is complete' do
        expect(subject).to be_complete
      end

    end
  end

end
