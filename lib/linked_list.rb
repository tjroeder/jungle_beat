require_relative './node'
class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def find_tail
    current = @head

    return current unless current.next_node
    return current unless current.next_node while current = current.next_node
  end

  def append(data)
    node = @head
    if node
      while node.next_node
        node = node.next_node
      end
      node.next_node = Node.new(data)
    else 
      @head = Node.new(data)
    end
    data
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
    return @head.data.to_s unless @head.next_node

    string = @head.data.to_s
    current = @head.next_node
    
    while current.next_node != nil do
      string << ' ' + current.data.to_s
      current = current.next_node
    end
    string << ' ' + current.data.to_s
  end

  def prepend(data)
    @head = Node.new(data) unless @head

    old_head = @head
    @head = Node.new(data)
    @head.next_node = old_head
    data
  end

  def insert(target, data)
    return prepend(data) if target <= 0
    return append(data) if target >= self.count

    current = @head
    prev = nil

    target.times do
      prev = current
      current = current.next_node
    end

    prev.next_node = Node.new(data)
    prev.next_node.next_node = current
    data
  end
end