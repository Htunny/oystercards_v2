require 'oystercard'

describe Oystercard do
  maximum_balance = Oystercard::MAXIMUM_BALANCE
  fare = Oystercard::FARE
  subject(:oystercard) { described_class.new }

describe '#new card' do
  it 'has a balance of zero when initialized' do
    expect(oystercard.balance).to eq 0
  end
    it { is_expected.to respond_to(:top_up).with(1).argument }
end

describe '#top up balance' do
  it 'tops up the balance of the card' do
    expect{ oystercard.top_up(maximum_balance) }.to change{ oystercard.balance }.by maximum_balance
  end

  it 'raises an error if the user exceeds the maximum amount' do
    oystercard.top_up(maximum_balance)
    expect{ oystercard.top_up(1) }.to raise_error "Maximum balance of £#{maximum_balance} exceeded"
  end
end

describe '#touch in' do
  it 'allows a user to touch in' do
    oystercard.top_up(maximum_balance)
    expect{ oystercard.touch_in("Aldgate") }.to change{ oystercard.balance }.by -fare
  end

  it 'changes in_journey? to true when touched in' do
    oystercard.top_up(maximum_balance)
    oystercard.touch_in("Aldgate")
    expect(oystercard.in_journey?).to eq true
  end

  it 'raises an error if there is insufficient funds on the card' do
    expect{ oystercard.touch_in("Aldgate") }.to raise_error "Insufficient funds"
  end

  it 'stores the entry station on the oystercard history' do
    oystercard.top_up(maximum_balance)
    oystercard.touch_in("Aldgate")
    expect(oystercard.history).to eq ["Aldgate"]
  end
  it { is_expected.to respond_to(:touch_in).with(1).argument }
end

describe '#touch out' do
  it 'allows a user to touch out' do
    oystercard.top_up(maximum_balance)
    oystercard.touch_in("Aldgate")
    expect{ oystercard.touch_out("Waterloo") }.to change{ oystercard.balance }.by -fare
  end

  it 'changes in_journey? to false when touched out' do
    oystercard.top_up(maximum_balance)
    oystercard.touch_in("Aldgate")
    expect{ oystercard.touch_out("Waterloo") }.to change{ oystercard.in_journey?}.to false
  end

  it 'stores the exit station on the oystercard history' do
    oystercard.top_up(maximum_balance)
    oystercard.touch_in("Aldgate")
    oystercard.touch_out("Waterloo")
    expect(oystercard.history).to eq ["Aldgate", "Waterloo"]
  end
    it { is_expected.to respond_to(:touch_out).with(1).argument }
end

end
