# frozen_string_literal: true

require 'oystercard'
describe Oystercard do
  let(:card) { Oystercard.new }
  let(:money_card) { Oystercard.new(50) }

  it 'should initialize with a default balance of 0' do
    expect(card.balance).to eq 0
  end

  it 'should be able to #touch_in' do
    money_card.touch_in
      expect(money_card).to be_in_journey
  end

  it 'should be able to #touch_out' do
    card.touch_out
      expect(card).not_to be_in_journey
  end

  describe '#top_up' do
    it 'tops up the users balance' do
      expect { card.top_up(5) }.to change { card.balance }.by(5)
    end

    it 'raises an error if balance limit exceeded' do
      expect { card.top_up(Oystercard::MAX_BALANCE + 1) }.to raise_error("Error: Limit of £#{Oystercard::MAX_BALANCE} reached")
    end
  end

  describe '#touch_in' do
    it 'raises an error if balance less than minimum amount' do
      expect { card.touch_in }.to raise_error('Insufficient funds')
    end
  end

  describe '#touch_out' do
    it 'deducts MIN_AMOUNT from balance' do
      expect { money_card.touch_out }.to change { money_card.balance }.by(-Oystercard::MIN_AMOUNT)
    end
  end
end
