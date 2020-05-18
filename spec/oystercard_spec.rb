# frozen_string_literal: true

require 'oystercard'
describe Oystercard do
  let(:card) { Oystercard.new }
  let(:money_card) { Oystercard.new(50) }

  it 'should initialize with a default balance of 0' do
    expect(card.balance).to eq 0
  end

  it { is_expected.to respond_to(:top_up).with(1).argument }

  it { is_expected.to respond_to(:deduct).with(1).argument }

  it { is_expected.to respond_to(:touch_in) }

  it { is_expected.to respond_to(:touch_out) }

  it 'should be able to #touch_in' do
    card.touch_in
    expect(card).to be_in_journey
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

  describe '#deduct' do
    it 'deducts cost from the users balance' do
      expect { money_card.deduct(10) }.to change { money_card.balance }.by(-10)
    end

    describe '#touch_in' do
      it 'raises an error if balance less than minimum amount' do
        expect { card.touch_in }.to raise_error('Insufficient funds')
      end
    end
  end
end
