# frozen_string_literal: true

require 'oystercard'
describe Oystercard do
  let(:card) { Oystercard.new }

  it 'should initialize with a default balance of 0' do
    expect(card.balance).to eq 0
  end

  describe '#top_up' do
    it 'should take the value to be added' do
      expect(card).to respond_to(:top_up).with(1).argument
    end

    it 'tops up the users balance' do
      expect { card.top_up(5) }.to change { card.balance }.by(5)
    end

    it 'raises an error if balance limit exceeded' do
      expect { card.top_up(Oystercard::MAX_BALANCE + 1) }.to raise_error("Error: Limit of £#{Oystercard::MAX_BALANCE} reached")
    end
  end
end
