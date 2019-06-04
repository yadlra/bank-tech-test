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
    transaction_details = { date: date.strftime("%d/%m/%Y"), credit: "-", debit: amount, balance: @balance }
    add_to_transactions(transaction_details)
  end

  def withdraw(amount, date = Date.today)
    @balance -= amount
    transaction_details = { date: date.strftime("%d/%m/%Y"), credit: "-", debit: amount, balance: @balance }
    add_to_transactions(transaction_details)
  end

  private

  def add_to_transactions(details)
    @statement.transaction_logging(details)
  end

end
