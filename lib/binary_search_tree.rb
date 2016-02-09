require 'pry'
require_relative 'Node'

class BinarySearchTree
  attr_accessor :root_node

  def initialize(root_node = nil)
    @root_node = root_node
  end

  # def score(data)
  #   if @head == nil
  #     @head = Node.new(score, movie)
  #

  def insert(score, movie)
    current_node = Node.new(score, movie)
    if @root_node.nil?
      @root_node = current_node
    elsif score < root_node
      root_node.left_link = current_node
    elsif score > root_node
      root_node.right_link = current_node
    end
  end

  #i'm taking notes:
  #do all nodes have a root_node attribute? the root_node attribute is the parent link



     #if root_node.left_link = nil
      #root_node.left_link = current_node
      #elsif current_node < root_node
      #^^ this isn't very pseudocodey but this is vv
      #

  # end

end
