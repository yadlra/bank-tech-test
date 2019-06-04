require 'statement'

describe Statement do
  let(:statement) { described_class.new }

  describe '#initialize' do
    it 'starts with empty transactions' do
      expect(statement.transactions).to eq []
    end
  end
end
