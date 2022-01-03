require_relative '../lib/jungle_beat'

RSpec.describe JungleBeat, type: :model do
  let!(:jb) { JungleBeat.new }

  describe 'attributes' do
    it 'creates a new LinkedList instance' do
      expect(jb.list).to be_a(LinkedList)
    end
  end

  describe 'instance methods' do
    describe '#append' do
      it 'returns the data string' do
        expect(jb.append('doo laa')).to eq('doo laa')
      end

      it 'can add one new node to list' do
        jb.append('doo')

        expect(jb.list.head.data).to eq('doo')
      end

      it 'can add multiple new nodes to list separated by spaces' do
        jb.append('doo laa haa deep goo')

        expect(jb.list.head.data).to eq('doo')
        expect(jb.list.head.next_node.data).to eq('laa')
        expect(jb.list.head.next_node.next_node.data).to eq('haa')
        expect(jb.list.head.next_node.next_node.next_node.data).to eq('deep')
        expect(jb.list.find_tail.data).to eq('goo')
        expect(jb.list.count).to eq(5)
      end

      it 'can append multiple nodes after nodes have been appended' do
        jb.append('doo da')
        jb.append('deep woo')

        expect(jb.list.head.next_node.next_node.data).to eq('deep')
        expect(jb.list.find_tail.data).to eq('woo')
      end
    end

    describe '#count' do
      it 'returns the list count' do
        jb.append('doo laa haa deep doo')

        expect(jb.count).to eq(5)
      end
    end
  end
end