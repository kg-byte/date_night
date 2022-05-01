class BinarySearchTree
  def initialize
  	@nodes = Hash.new
  end
  def insert(score, movie)
  	  node = nodes[:movie] = score
  	  depth_of(node)
  end

  def depth_of(node)
  	index = nodes.find_index(node)
  	
  end



end