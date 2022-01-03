require_relative './linked_list'

class JungleBeat
  attr_reader :list

  def initialize
    @list = LinkedList.new
  end

  def append(data)
    data.split(' ').map do |d|
      @list.append(d)
    end.join(' ')
  end
  
  def count
    list.count
  end
end