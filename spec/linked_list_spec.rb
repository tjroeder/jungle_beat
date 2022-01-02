require_relative '../lib/linked_list'

RSpec.describe LinkedList, type: :model do
  let!(:list_1) { LinkedList.new }
  describe 'attributes' do
    it 'has a head value of nil' do
      expect(list_1.head).to eq(nil)
    end
  end

  describe 'instance methods' do
    describe '#append' do
      it 'should return the node data when appended' do
        expect(list_1.append('doop')).to eq('doop')
      end

      it 'should add a Node to the head attribute' do
        list_1.append('doop')

        expect(list_1.head).to be_an_instance_of(Node)
      end

      it 'should set new Node data to the append parameter' do
        list_1.append('doop')

        expect(list_1.head.data).to eq('doop')
      end

      it 'should have no next node if list is count 1' do
        list_1.append('doop')

        expect(list_1.head.next_node).to eq(nil)
      end

      it 'should add new node to end if head exists' do
        list_1.append('doop')
        list_1.append('deep')

        expect(list_1.head.next_node).to be_a(Node)
        expect(list_1.head.next_node).to have_attributes(data: 'deep')
      end
    end

    describe '#count' do
      it 'should return the total node count' do
        expect(list_1.count).to eq(0)

        list_1.append('doop')

        expect(list_1.count).to eq(1)
      end

      it 'should return the total node count with multiple nodes' do
        list_1.append('doop')
        list_1.append('deep')
        list_1.append('dah')

        expect(list_1.count).to eq(3)
      end
    end

    describe '#to_string' do
      it 'should return node data in a single string' do
        list_1.append('doop')

        expect(list_1.to_string).to eq('doop')
      end

      it 'should return node data in a string separated by spaces' do
        list_1.append('doop')
        list_1.append('deep')
        list_1.append('dah')

        expect(list_1.to_string).to eq('doop deep dah')
      end
    end
  end
end