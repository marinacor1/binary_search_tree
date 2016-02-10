require_relative 'binary_search_tree'

class Node
  attr_accessor :score, :movie, :right_link, :left_link, :depth

  def initialize(score, movie, right_link = nil, left_link = nil)
    @score = score
    @movie = movie
    @right_link = right_link
    @left_link = left_link
    @depth = 0
  end

end
