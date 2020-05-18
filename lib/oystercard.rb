# frozen_string_literal: true

class Oystercard
  attr_reader :balance
  DEFAULT_BALANCE = 0

  def initialize(_balance = DEFAULT_BALANCE)
    @balance = DEFAULT_BALANCE
  end

  def top_up(value)
    @balance += value
  end
end
