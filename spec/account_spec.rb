require 'account'
require 'statement'
require 'date'

describe Account do
  let(:account) { described_class.new }
  let(:date) { Date.parse('04/06/2019')}

  it 'has a balance of zero' do
    expect(subject.balance).to eq(0)
  end

  it 'has an instance of Statement' do
    expect(subject.statement).to be_an_instance_of(Statement)
  end


  describe '#deposit' do
    it { is_expected.to respond_to(:deposit).with(1).argument }
    let(:deposit_transaction) { { date: date, credit: "-", debit: 1000, balance: 1000 } }

    it 'can deposit to the account' do
      expect{ subject.deposit 1000 }.to change{ subject.balance }.by 1000
    end

    it 'adds deposits to statement' do
      account.deposit(1000)
      expect(account.statement.transactions).to include { deposit_transaction }
    end
  end


  describe '#withdraw' do
    it { is_expected.to respond_to(:withdraw).with(1).argument }
    let(:withdraw_transaction) { { date: date, credit: 1000, debit: "-", balance: 0 }}

    it 'deducts from balance when withdrawing' do
      expect{ subject.withdraw 200 }.to change{ subject.balance }.by -200
    end

    it 'adds withdrawals to statement' do
      account.withdraw(200)
      expect(account.statement.transactions).to include { withdraw_transaction}
    end
  end

  describe '#view_statement' do
    it 'prints bank statement' do
      allow(Date).to receive(:today).and_return (date)
      account.deposit(2000)
      account.withdraw(500)
      print_view = 'date || credit || debit || balance' +  "\n" '04/06/2019 || 500 || 2000 || 1500' + "\n"
      expect{expect{account.view_statement}.to output(view_statement).to_stdout}
    end
  end



end
