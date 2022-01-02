require_relative '../lib/node'

RSpec.describe Node, type: :model do
  let!(:node_1) { Node.new('plop') }

  describe 'attributes' do
    it 'has data' do
      expect(node_1.data).to eq('plop')
    end

    it 'has no next node originally' do
      expect(node_1.next_node).to eq(nil)
    end

    it 'can update next_node' do
      node_2 = Node.new('doop')
      node_1.next_node = node_2

      expect(node_1.next_node).to eq(node_2)
    end
  
  end
end