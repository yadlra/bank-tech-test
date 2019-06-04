require 'statement'

describe Statement do
  let(:statement) { described_class.new }
  let(:date) { Date.parse('04/06/2019') }

  describe '#initialize' do
    it 'starts with empty transactions' do
      expect(statement.transactions).to eq []
    end
  end
end
