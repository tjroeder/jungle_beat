require_relative './node'
class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def append(new_node)
    @head = Node.new(new_node)
    new_node
  end

  def count
    return 0 unless @head
    count = 1
    current = @head
    while current.next_node != nil do
      count += 1
      current = current.next_node
    end
    count
  end

  def to_string
    return '' unless @head
    current = @head
    string = current.data.to_s
    while current.next_node != nil do
      string << current.data.to_s
    end
    string
  end
end