require 'node'

class BinarySearchTree
  attr_accessor :root
  def initialize
    @root = nil
  end

  def insert(score, movie, depth = 0)
    if !@root 
      @root = Node.new(score, movie)
      @root.depth = 0
    else 
      parent_node = find_parent(score)
      if parent_node.score > score
        parent_node.left = Node.new(score, movie)
        new_node = parent_node.left
      else
        parent_node.right = Node.new(score, movie)
        new_node = parent_node.right
      end
      new_node.depth = depth_of(score)
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

  def sort(movies_asc = [], node = @root)
    movies_asc << node.data if !movies_asc.include?(node.data)
    index = movies_asc.find_index(node.data)
    movies_asc.insert(index, node.left.data) if node.left
    movies_asc.insert(index+2,node.right.data) if node.right
    sort(movies_asc, node.left) if node.left
    sort(movies_asc, node.right) if node.right
    movies_asc.compact
  end

  def load(dir)
    lines = File.readlines(dir)
    n = 0
    lines.each do |line|
      data=line.delete("\n").split(',')
      insert(data[0],data[1])
      n+=1
    end
    n
  end

  def all_nodes(nodes = [], node = @root)
    nodes << node if !nodes.include?(node)
    all_nodes(nodes, node.left) if node.left
    all_nodes(nodes, node.right) if node.right 
    nodes
  end

  def find_nodes(depth)
    all_nodes.select {|node| node.depth == depth}
  end

  def num_of_children(node, num = 1)
    num += 1 if node.left
    num += 1 if node.right
    num = num_of_children(node.left, num) if node.left
    num = num_of_children(node.right, num) if node.right  
    num
  end

  def health(depth)
    current_nodes = find_nodes(depth)
    total_nodes = all_nodes.count
    result = []
    if current_nodes != []
      current_nodes.each do |node|
        result << [node.score, num_of_children(node), (100*num_of_children(node)/total_nodes).floor]
      end
    end
    result
  end
end