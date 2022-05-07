class Node
attr_reader :data, :score
attr_accessor :left, :right
  def initialize(score, movie)
  	@data = Hash.new
  	@data[movie] = score
  	@left = nil 
  	@right = nil 
    @score = score
  end

end