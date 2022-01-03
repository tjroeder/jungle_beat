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

    describe '#find' do
      it 'should return nothing if request 0 nodes' do
        list_1.append('deep')
        list_1.append('woo')

        expect(list_1.find(1, 0)).to eq('')
      end

      it 'should return a string element' do
        list_1.append('woo')
        list_1.append('wat')

        expect(list_1.find(1, 1)).to be_a(String)
      end

      it 'should return one element at a given location' do
        list_1.append('woo')
        list_1.append('wat')
        list_1.append('huh')

        expect(list_1.find(1, 1)).to eq('wat')
      end

      it 'should return multiple elements from a given location' do
        list_1.append('woo')
        list_1.append('wat')
        list_1.append('huh')
        list_1.append('deep')

        expect(list_1.find(1, 3)).to eq('wat huh deep')
      end

      it 'should return all elements even if outside the list' do
        list_1.append('woo')
        list_1.append('wat')
        list_1.append('huh')
        list_1.append('deep')

        expect(list_1.find(1, 4)).to eq('wat huh deep')
      end

      it 'should return empty string if target is outside the linked list' do
        list_1.append('woo')
        list_1.append('wat')
        list_1.append('huh')

        expect(list_1.find(3, 1)).to eq('')
      end
    end

    describe '#includes?' do
      it 'should return true if it is the first node' do
        list_1.append('woo')
        list_1.append('wat')

        expect(list_1.includes?('woo')).to eq(true)
      end

      it 'should return false if it is not inside the linked list' do
        list_1.append('woo')
        list_1.append('wat')

        expect(list_1.includes?('deep')).to eq(false)
      end

      it 'should return true if data is inside the linked list' do
        list_1.append('woo')
        list_1.append('wat')
        list_1.append('deep')

        expect(list_1.includes?('wat')).to eq(true)
      end

      it 'should return true if data is last in the linked list' do
        list_1.append('woo')
        list_1.append('wat')
        list_1.append('deep')

        expect(list_1.includes?('deep')).to eq(true)
      end
    end

    describe '#pop' do
      it 'should return the last value' do
        list_1.append('woo')
        list_1.append('wat')

        expect(list_1.pop).to eq('wat')
      end

      it 'should remove the last item in the list' do
        list_1.append('woo')
        list_1.append('wat')
        list_1.pop

        expect(list_1.find_tail.data).to eq('woo')
      end

      it 'should remove the head if there is one node in the list' do
        list_1.append('woo')
        list_1.pop

        expect(list_1.head).to eq(nil)
      end

      it 'should do nothing if there are no items in the list' do
        list_1.append('woo')
        list_1.pop

        expect(list_1.pop).to eq(nil)
      end
    end
  end
end