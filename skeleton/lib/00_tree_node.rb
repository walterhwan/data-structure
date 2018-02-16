require 'byebug'

class PolyTreeNode

  # attr_reader :value, :parent, :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent
    @parent
  end

  def parent=(node)
    unless self.parent.nil?
      parent.children.delete(self)
    end

    if node != nil
      node.children << self
    end
    @parent = node
  end

  def add_child(node)
    node.parent = self
  end

  def remove_child(node)

    if self.children.include?(node)
      node.parent = nil
    else
      raise "ERROR"
    end
    # self.children.delete(node)
  end

  def children
    @children
  end

  def value
    @value
  end

  def dfs(val)
    return self if self.value == val
    self.children.each do |node|
      found_node = node.dfs(val)
      return found_node if found_node != nil
    end
    nil
  end

  def bfs(val)
    queue = [self]

    until queue.empty?
      node = queue.shift
      return node if node.value == val
      queue += node.children
    end

    nil
  end



end
