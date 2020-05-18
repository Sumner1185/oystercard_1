# frozen_string_literal: true

class Oystercard
  attr_reader :balance
  DEFAULT_BALANCE = 0
  MAX_BALANCE = 90

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
  end

  def top_up(value)
    raise "Error: Limit of £#{MAX_BALANCE} reached" if balance_exceeded?(value)

    @balance += value
  end

  def deduct(value)
    @balance -= value
  end

  def touch_in

  end

  def touch_out

  end

  private

  def balance_exceeded?(value)
    balance + value > MAX_BALANCE
  end
end
