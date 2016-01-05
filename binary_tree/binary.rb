class Leaf
  attr_accessor :data
  attr_accessor :left_leaf
  attr_accessor :right_leaf

  def initialize(data, left_leaf = nil, right_leaf = nil)
    @data = data
    @left_leaf = left_leaf
    @right_leaf = right_leaf
  end
end

class Tree
  attr_accessor :head

  def initialize(data)
    @head = Leaf.new(data)
  end

  def insert_leaf(data, current_head = nil)
    current_head ||= head
    if data < current_head.data
      if current_head.left_leaf == nil
        current_head.left_leaf = Leaf.new(data)
      elsif current_head.left_leaf != nil
        current_head = current_head.left_leaf
        insert_leaf(data, current_head)
      end
    else
      if current_head.right_leaf == nil
        current_head.right_leaf = Leaf.new(data)
      elsif current_head.right_leaf != nil
        current_head = current_head.right_leaf
        insert_leaf(data, current_head)
      end
    end
  end
end

tree = Tree.new(3)
tree.insert_leaf(1)
tree.insert_leaf(2)
p tree