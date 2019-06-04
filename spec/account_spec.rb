require 'account'
require 'statement'
require 'date'

describe Account do
  let(:account) { described_class.new }

  it 'has a balance of zero' do
    expect(subject.balance).to eq(0)
  end

  it 'has an intance of Statement' do
    expect(subject.statement).to be_an_instance_of(Statement)
  end

  describe '#deposit' do

    it { is_expected.to respond_to(:deposit).with(1).argument }
    let(:date) { Date.parse('04/06/2019') }

    it 'can deposit to the account' do
      expect{ subject.deposit 1000 }.to change{ subject.balance }.by 1000
    end

    it 'adds deposits to statement' do
      account.deposit(1000)
      transactions = [{credit: 0, debit: 1000, balance: 1000}]
      expect(account.statement.transactions).to eq transactions
    end
  end

  describe '#withdraw' do

    it { is_expected.to respond_to(:withdraw).with(1).argument }
    let(:date) { Date.parse('04/06/2019') }

    it 'deducts from balance when withdrawing' do
      expect{ subject.withdraw 200 }.to change{ subject.balance }.by -200
    end
  end
end
