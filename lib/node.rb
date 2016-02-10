require_relative 'binary_search_tree'

class Node
  attr_accessor :score, :movie, :parent_link, :right_link, :left_link, :depth

  def initialize(score, movie, right_link = nil, left_link = nil)
    @score = score
    @movie = movie
    @right_link = right_link
    @left_link = left_link
    @depth = 0
     #left_link & right_link = nil is that a dead end?
     #left_link = nil, maybe just lowest num in that particular chain, but take all left_link = nil and compare them to see smallest num
  end

end
