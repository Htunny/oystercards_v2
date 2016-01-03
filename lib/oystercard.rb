class Oystercard

  attr_reader :balance, :in_journey

  MAXIMUM_BALANCE = 90
  FARE = 2.50

  def initialize
    @balance = 0
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end

  def top_up(amount)
    fail "Maximum balance of £#{MAXIMUM_BALANCE} exceeded" if @balance + amount > MAXIMUM_BALANCE
    @balance = @balance + amount
  end

  def touch_in(entry_station)
    fail 'Insufficient funds' if @balance < FARE
    deduct(FARE)
    @in_journey = true
  end

  def touch_out(exit_station)
    deduct(FARE)
    @in_journey = false
  end

private

  def deduct(amount)
    @balance = @balance - amount
  end

end
