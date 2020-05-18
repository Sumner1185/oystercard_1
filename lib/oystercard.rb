# frozen_string_literal: true

class Oystercard
  attr_reader :balance, :entry_station
  DEFAULT_BALANCE = 0
  MAX_BALANCE = 90
  MIN_AMOUNT = 1

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
  end

  def top_up(value)
    raise "Error: Limit of £#{MAX_BALANCE} reached" if balance_exceeded?(value)

    @balance += value
  end

  def touch_in(entry_station)
    raise 'Insufficient funds' unless sufficient_funds?

    @entry_station = entry_station
  end

  def touch_out
    deduct(MIN_AMOUNT)
    @entry_station = nil
    
  end

  def in_journey?
    !!@entry_station
  end

  private

  def deduct(value)
    @balance -= value
  end

  def balance_exceeded?(value)
    balance + value > MAX_BALANCE
  end

  def sufficient_funds?
    @balance >= MIN_AMOUNT
  end
end
