require 'journey'

describe Journey do
  context 'before starting a journey' do
    it 'shows whether journey is complete' do
      expect(subject).not_to be_complete
    end
    it 'shows the penalty fare as the default fare' do
      expect(subject.fare).to eq Journey::PENALTY_FARE
    end
    it 'is able to start the journey by touching in' do
      expect(subject).to respond_to :touch_in
    end
  end
end
