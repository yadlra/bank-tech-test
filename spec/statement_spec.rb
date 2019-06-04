require 'statement'

describe Statement do
  let(:statement) { described_class.new }
  let(:deposit_transaction) { { date: date, credit: "-", debit: 1000, balance: 1000 } }
  let(:withdraw_transaction) { { date: date, credit: 1000, debit: "-", balance: 0 }}
  let(:date) { Date.parse('04/06/2019') }


  describe '#initialize' do
    it 'starts with empty transactions' do
      expect(statement.transactions).to eq []
    end
  end

  describe '#transaction_logging' do
    it 'logs deposit transaction to statement' do
      allow(Date).to receive(:today).and_return(date)
      statement.transaction_logging(deposit_transaction)
      expect(statement.transactions).to include {deposit_transaction}
    end

    it 'logs withdraw transaction to statement' do
      allow(Date).to receive(:today).and_return(date)
      statement.transaction_logging(withdraw_transaction)
      expect(statement.transactions).to include {withdraw_transaction}
    end
  end

  describe '#format' do
    it 'sets the format for the statement' do
      allow(Date).to receive(:today).and_return(date)
      statement.transaction_logging(deposit_transaction)
      format_view = 'date || credit || debit || balance' +  "\n" '04/06/2019 || - || 1000 || 1000' + "\n"
      expect{expect{statement.format}.to output(format_view).to_stdout}
    end
  end
end
