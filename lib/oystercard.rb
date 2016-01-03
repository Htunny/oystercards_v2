class Oystercard

  attr_reader :balance

  MAXIMUM_BALANCE = 90

  def initialize
    @balance = 0
  end

  def top_up(amount)
    fail 'Maximum balance allowed is £90' if @balance + amount > 90
    @balance = @balance + amount
  end

end
