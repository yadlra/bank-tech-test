require 'account'

describe Account do

  it 'has a balance of zero' do
    expect(subject.balance).to eq(0)
  end

  describe '#deposit' do

    it { is_expected.to respond_to(:deposit).with(1).argument }

    it 'can deposit to the account' do
      expect{ subject.deposit 1 }.to change{ subject.balance }.by 1
    end
  end
end
