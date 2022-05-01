require 'node'

class BinarySearchTree
  attr_accessor :root, :depth
  def initialize
    @root = nil
  end

  def insert(score, movie)
    depth = 0
  	if @root == nil 
      @root = Node.new(score, movie)
    else 
      current_node = @root
      previous_node = @root
      while current_node != nil 
        previous_node = current_node
        if current_node.data.values[0] > score 
          current_node = previous_node.left
          depth +=1
        else 
          current_node = previous_node.right
          depth +=1
        end
      end
      if previous_node.data.values[0] > score
        previous_node.left = Node.new(score, movie)
      else
        previous_node.right = Node.new(score, movie)
      end
    end
    depth
  end

  def include?(score, node = self.root)
    if node == nil
      return false
    elsif node.data.values[0] > score
      return include?(score, node.left)
    elsif node.data.values[0] < score 
      return include?(score, node.right)
    else
      return true
    end
  end

  def depth_of(score, node = self.root, depth = 0)
    if node == nil 
      return nil 
    elsif node.data.values[0] > score
      depth += 1
      return depth_of(score, node = node.left, depth)
    elsif node.data.values[0] < score
      depth += 1
      return depth_of(score, node = node.right, depth)
    else 
      return depth 
    end
  end

  def max(node = self.root)
    if node == nil 
      return nil 
    elsif node.right == nil 
      return node.data
    end
    return max(node = node.right)
  end

  def min(node = self.root)
    if node == nil 
      return nil 
    elsif node.left == nil 
      return node.data
    end
    return min(node = node.left)
  end

end