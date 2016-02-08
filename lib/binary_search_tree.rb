require 'pry'
require_relative 'Node'

class BinarySearchTree
  attr_accessor :head

  def initialize(data = nil)
    data.split (" ").each do |score|
    insert(score)
  end

  def score(data)

  end

end
