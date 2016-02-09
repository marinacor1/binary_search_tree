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
    current_node = Node.new(score, movie)
    if node.nil?
      @root_node = Node.new(score, movie)
    elsif score < node.score
      @left_count +=1
      node.left_link = current_node
      insert(score, movie, node.left_link)
    elsif score > node.score
      @right_count +=1
      node.right_link = current_node
      insert(score, movie, node.right_link)
    end
    depth(@left_count, @right_count)
    # depth_of(score)
  end
  # max(left_count+1,right_count+1)

  def include?(value, node = @root_node)
    if node.nil?
      false
    elsif value == node.score
      true
    elsif value < node.score
      if node.left_link.nil?
        false
        else include?(value, node.left_link)
      end
    elsif
      value > node.score
      if node.right_link.nil?
        false
        else include?(value, node.right_link)
      end
    else
      false
    end
  end

  def depth(left_count, right_count)
    if @root_node.nil?
      depth = -1
    end
    if left_count == 0  && right_count == 0
      depth = 0
    else
      if left_count < right_count
        depth = right_count + 1
      else
        depth = left_count + 1
       end
     end
     depth
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
