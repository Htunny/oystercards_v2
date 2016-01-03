require 'oystercard'

describe Oystercard do
  it 'has a balance of zero when initialized' do
    oystercard = Oystercard.new
    expect(oystercard.balance).to eq 0
  end

  it 'tops up the balance of the card' do
    oystercard = Oystercard.new
    expect{ oystercard.top_up(10) }.to change{ oystercard.balance }.by 10
  end

  it 'raises an error if the user exceeds the maximum amount' do
    oystercard = Oystercard.new
    expect{oystercard.top_up(100)}.to raise_error "Maximum balance allowed is £90"
  end
end
