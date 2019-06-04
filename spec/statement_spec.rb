require 'statement'

describe Statement do
  let(:statement) { described_class.new }
  let(:deposit_transaction) { { credit: 0, debit: 1000, balance: 1000 } }
  let(:withdraw_transaction) { { credit: 1000, debit: 0, balance: 0 }}
  let(:date) { Date.parse('04/06/2019') }


  describe '#initialize' do
    it 'starts with empty transactions' do
      expect(statement.transactions).to eq []
    end
  end

  describe '#transaction_logging' do
    it 'logs deposit transaction to statement' do
      statement.transaction_logging(deposit_transaction)
      expect(statement.transactions).to include {deposit_transaction}
    end

    it 'logs withdraw transaction to statement' do
      statement.transaction_logging(withdraw_transaction)
      expect(statement.transactions).to include {withdraw_transaction}
    end
  end
end
