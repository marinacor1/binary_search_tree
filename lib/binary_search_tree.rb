require 'pry'
require_relative 'Node'

class BinarySearchTree
  attr_accessor :root_node, :left_count, :right_count

  def initialize(root_node = nil)
    @root_node = root_node
    @left_count = 0
    @right_count = 0
  end

  def insert(score, movie, node = @root_node)
    # binding.pry
    current_node = Node.new(score, movie)
    if node.nil?
      @root_node = Node.new(score, movie)
      #maybe bc nothing is getting passed in .
      #@root_node is adding each element to it
    elsif score < node.score
      @left_count +=1
      node.left_link = current_node
      depth(@left_count, @right_count)
      insert(score, movie, node.left_link)
    elsif score > node.score
      @right_count +=1
      node.right_link = current_node
      depth(@left_count, @right_count)
      insert(score, movie, node.right_link)
    end
    depth(@left_count, @right_count)
  end

  # def depth(root_node)
  #   if root.nil?
  #     max_depth = -1
  #   else
  #     left_depth = depth(root_node, left_count)
  #     right_depth = depth(root_node, right_count)
  #     max_depth = (left_depth, right_depth) + 1
  #     #what does line 38 do? are we trying to find the sum, the average, the largest of the two, the smallest of the two?
  #   end
  # end

  def depth(left_count, right_count)
    # binding.pry
    if @root_node.nil?
      depth = 0
    end
    if left_count == 0  && right_count == 0
      depth = -1
    else
      if left_count < right_count
        depth = right_count +1
      else
        depth = left_count +1
      end
    end
    depth
  end

  def include?(value, first_node_of_list)
    if value == @root_node.score
      true
    elsif @root_node.nil?
      false
    else
      include?(value, first_node_of_list.link)
      #passes in node to next smallest
    end
  end

  def depth_of(score)

  end

  def max
    #follows right leg until it's linked to nil, reads that score
  end

  def min
    #follows left leg until it's linked to nil, reads that score

  end
     #if root_node.left_link = nil
      #root_node.left_link = current_node
      #elsif current_node < root_node

end
