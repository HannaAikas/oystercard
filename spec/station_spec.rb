require 'station'

describe Station do
  station = Station.new("Lambeth",1)
  it 'knows its name' do
    expect(station.name).to eq "Lambeth"
  end
  it 'knows its zone' do
    expect(station.zone).to eq 1
  end
end
