require 'oystercard'
describe Oystercard do
  let(:card) { Oystercard.new }

  it 'should initialize with a default balance of 0' do
    expect(card.balance).to eq 0
  end
 
end