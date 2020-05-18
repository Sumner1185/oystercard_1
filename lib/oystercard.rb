# frozen_string_literal: true

class Oystercard
  attr_reader :balance, :in_journey
  DEFAULT_BALANCE = 0
  MAX_BALANCE = 90
  MIN_AMOUNT = 1

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @in_journey = false
  end

  def top_up(value)
    raise "Error: Limit of £#{MAX_BALANCE} reached" if balance_exceeded?(value)

    @balance += value
  end

  def touch_in
    raise 'Insufficient funds' unless sufficient_funds?

    @in_journey = true
  end

  def touch_out
    @in_journey = false
    deduct(MIN_AMOUNT)
  end

  def in_journey?
    in_journey
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
