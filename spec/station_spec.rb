require 'station'

describe Station do
  subject(:station) { described_class.new(name: "Aldgate", zone: 1) }

  it 'shows the station name' do
    expect(station.name).to eq("Aldgate")
  end

  it 'shows the station zone' do
    expect(station.zone).to eq(1)
  end
end
