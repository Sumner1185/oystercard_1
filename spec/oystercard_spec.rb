# frozen_string_literal: true

require 'oystercard'
describe Oystercard do
  let(:card) { Oystercard.new }

  it 'should initialize with a default balance of 0' do
    expect(card.balance).to eq 0
  end

  it 'top up method should take the value to be added' do
    expect(card).to respond_to(:top_up).with(1).argument
  end

  it 'tops up the users balance' do
    expect { card.top_up(5) }.to change { card.balance }.by(5)
  end
end
