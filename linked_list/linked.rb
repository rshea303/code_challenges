class Node
  attr_accessor :data
  attr_accessor :next_node

  def initialize(data, node_pointer = nil)
    @data = data
    @next_node = node_pointer
  end
end

class List
  attr_accessor :head

  def initialize(data)
    @head = Node.new(data)
  end

  def insert_node(data)
    current_head = @head
    until current_head.next_node == nil
      current_head = current_head.next_node
    end
    current_head.next_node = Node.new(data)
  end

  def display_list
    current_head = @head
    collector = []
    until current_head.next_node == nil
      collector << current_head.data
      current_head = current_head.next_node
    end
    collector << current_head.data
    collector.join(' -> ')
  end

  def remove_node(value)
    current_head = @head
    until current_head.data == value
      first_link = current_head
      current_head = current_head.next_node
      last_link = current_head.next_node
    end
    first_link.next_node = last_link
  end
end

linked_list = List.new(1)
linked_list.insert_node(2)
linked_list.insert_node(3)

puts linked_list.display_list

linked_list.remove_node(2)

puts linked_list.display_list