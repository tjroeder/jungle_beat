require_relative '../lib/linked_list'

RSpec.describe LinkedList, type: :model do
  let!(:list_1) { LinkedList.new }
  describe 'attributes' do
    it 'has a head value of nil' do
      expect(list_1.head).to eq(nil)
    end
  end

  describe 'instance methods' do
    describe '#find_tail' do
      it 'should return a node type' do
        list_1.append('woo')

        expect(list_1.find_tail).to be_a(Node)
      end

      it 'should return the last node in the list' do
        list_1.append('woo')
        list_1.append('deep')
        list_1.append('dop')

        expect(list_1.find_tail.data).to eq('dop')
      end
    end

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

    describe '#prepend' do
      it 'should create new head if no head' do
        expect(list_1.head).to eq(nil)

        list_1.prepend('doop')

        expect(list_1.head.data).to eq('doop')
      end

      it 'should create a new head node' do
        list_1.append('doop')

        expect(list_1.head.data).to eq('doop')
        list_1.prepend('deep')

        expect(list_1.head.data).to eq('deep')
      end

      it 'should have the old head node as head.next_node' do
        list_1.append('doop')
        list_1.append('deep')
        expect(list_1.head.data).to eq('doop')

        list_1.prepend('dop')
        expect(list_1.head.next_node.data).to eq('doop')
      end

      it 'should return new node data' do
        expect(list_1.prepend'woo').to eq('woo')
      end
    end

    describe '#insert' do
      it 'should insert new node in the first position if 0 or less' do
        list_1.append('doop')
        list_1.append('deep')
        list_1.insert(0, 'woo')
        
        expect(list_1.head.data).to eq('woo')
        
        list_1.insert(-1, 'wat')
        expect(list_1.head.data).to eq('wat')
      end
      
      it 'should insert new node somewhere in the middle' do
        list_1.append('doop')
        list_1.append('deep')
        list_1.append('woop')
        list_1.insert(1, 'woo')

        expect(list_1.head.next_node.data).to eq('woo')
      end
      
      it 'should insert new node in the last position' do
        list_1.append('doop')
        list_1.append('deep')
        list_1.insert(2, 'woo')
        
        expect(list_1.head.next_node.next_node.data).to eq('woo')

        list_1.insert(5, 'wat')
        expect(list_1.head.next_node.next_node.next_node.data).to eq('wat')
      end

      it 'should return the data of the new node' do
        expect(list_1.insert(0, 'woo')).to eq('woo')
      end
    end
  end
end