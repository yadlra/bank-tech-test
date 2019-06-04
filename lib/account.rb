 require 'date'

class Account
attr_reader :balance, :statement
START_BALANCE = 0

  def initialize(statement = Statement.new)
    @balance = START_BALANCE
    @statement = statement
  end

  def deposit(amount, date = Date.today)
    @balance += amount
    @statement.transactions << { credit: 0, debit: amount, balance: @balance}
  end

  def withdraw(amount, date = Date.today)
    @balance -= amount
  end

end
