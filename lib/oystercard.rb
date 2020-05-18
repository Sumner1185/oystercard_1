# frozen_string_literal: true

class Oystercard
  attr_reader :balance
  DEFAULT_BALANCE = 0
  MAX_BALANCE = 90

  def initialize(_balance = DEFAULT_BALANCE)
    @balance = DEFAULT_BALANCE
  end

  def top_up(value)
    fail "Error: Limit of £#{MAX_BALANCE} reached" if balance_exceeded?(value)

    @balance += value
  end

  def deduct(value)

  end

  private
  def balance_exceeded?(value)
    balance + value > MAX_BALANCE
  end
end
