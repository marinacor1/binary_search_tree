require 'pry'
require_relative 'Node'

class BinarySearchTree
  attr_accessor :root_node, :left_row, :right_row

  def initialize(root_node = nil)
    @root_node = root_node
    @left_row = 0
    @right_row = 0
  end

  # def score(data)
  #   if @head == nil
  #     @head = Node.new(score, movie)
  #

  def insert(score, movie, node = @root_node)
    # binding.pry
    current_node = Node.new(score, movie)
    if node.nil?
      @root_node = Node.new(score, movie)
    elsif score < node.score
      @left_row +=1
      node.left_link = current_node
      depth(@left_row, @right_row)
      insert(score, movie, node.left_link)
    elsif score > node.score
      @right_row +=1
      node.right_link = current_node
      depth(@left_row, @right_row)
      insert(score, movie, node.right_link)
    end
    depth(@left_row, @right_row)
  end

  def depth(left_row, right_row)
    # binding.pry/
    if @root_node.nil?
      depth = -1
    end
    if left_row == 0  && right_row == 0
      depth = 0
    else
      if left_row < right_row
        depth = right_row + 1
      else
        depth = left_row + 1
      end
    end
    depth
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
