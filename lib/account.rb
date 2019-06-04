class Account
attr_reader :balance
START_BALANCE = 0

  def initialize
    @balance = START_BALANCE
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end

end
