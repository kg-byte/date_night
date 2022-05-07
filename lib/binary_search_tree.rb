require 'node'

class BinarySearchTree
  attr_accessor :root, :depth
  def initialize
    @root = nil
  end

  def insert(score, movie, depth = 0)
    if !@root 
      @root = Node.new(score, movie)
    else 
      parent_node = find_parent(score)
      parent_node.left = Node.new(score, movie) if parent_node.score > score
      parent_node.right = Node.new(score, movie) if parent_node.score < score
    end
    depth_of(score)
  end


  def find_parent(score)
    current_node = previous_node =  @root
    while current_node 
      previous_node = current_node
      current_node = previous_node.left if previous_node.score > score 
      current_node = previous_node.right if previous_node.score < score 
    end
    previous_node
  end

  def include?(score, node = self.root)
    return false if !node 
    return include?(score, node.left) if node.score > score
    return include?(score, node.right) if node.score < score 
    return true
  end

  def depth_of(score, node = self.root, depth = 0)
    return nil if !node
    return depth if node.score == score
    depth +=1
    return depth_of(score, node = node.left, depth) if node.score > score
    return depth_of(score, node = node.right, depth) if node.score < score
  end

  def max(node = self.root)
    return nil if !node 
    return node.data if !node.right
    return max(node = node.right)
  end

  def min(node = self.root)
    return nil if !node
    return node.data if !node.left 
    return min(node = node.left)
  end
end