require_relative '../lib/linked_list'

RSpec.describe LinkedList, type: :model do
  let!(:list_1) { LinkedList.new }
  describe 'attributes' do
    it 'has a head value of nil' do
      expect(list_1.head).to eq(nil)
    end
  end
end