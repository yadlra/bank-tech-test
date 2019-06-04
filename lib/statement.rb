class Statement
  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def transaction_logging(details)
    @transactions << details
  end
end
