require 'pry'
require_relative 'node'

class BinarySearchTree
  attr_accessor :root_node, :left_count, :right_count, :max_node

  def initialize
    @root_node = root_node
    @left_count = 0
    @right_count = 0
    @max_node = 0
    @min_node = 0
    @depth_counter = 0
    @left_counter = 0
    @right_counter = 0

  end

  def insert(score, movie, node = @root_node)
    current_node = Node.new(score, movie)
    if node.nil?
      @root_node = Node.new(score, movie)
    elsif score < node.score && node.left_link
      node.depth +=1
      insert(score, movie, node.left_link)
    elsif score < node.score && node.left_link.nil?
      node.depth += 1
      node.left_link = current_node
      node.depth +=1
    elsif score > node.score && node.right_link
      node.depth += 1
      insert(score, movie, node.right_link)
      node.depth += 1
    else score > node.score && node.right_link.nil?
      node.right_link = current_node
      node.right_link.depth += 1
      # node.depth += 1
    end
      if @left_counter > @right_counter
      @depth_counter = @right_counter
      else
        @depth_counter =  @left_counter
      end
      @depth_counter + 1
  end

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
    elsif value > node.score
      if node.right_link.nil?
        false
      else include?(value, node.right_link)
      end
    else
      false
    end
  end

  def depth_of(score, node = @root_node)
    if node.nil?
      nil
    elsif node.score == score
      node.depth
    elsif score < node.score && node.left_link
      depth_of(score, node.left_link)
    else score > node.score && node.right_link
      depth_of(score, node.right_link)
    end
  end

  def max(node = @root_node)
    maximum = {}
    if node.nil?
      nil
    elsif node.score < @max_node
      @max_node
    elsif node.score > @max_node && node.right_link
      @max_node = node.score
      max(node.right_link)
    else node.score > @max_node && node.right_link.nil?
      @max_node = node.score
      @max_movie = node.movie
    end
    maximum[@max_movie] = @max_node
    maximum
  end

  def min(node = @root_node)
    minimum = {}
    if node.nil?
      nil
    elsif node.score > @min_node
      @min_node
    elsif node.score < @min_node && node.left_link
      @min_node = node.score
      min(node.right_link)
    elsif node.score < @min_node && node.left_link.nil?
      @min_node = node.score
      @min_movie = node.movie
    end
    minimum[@min_movie] = @min_mode
    minimum
  end

  def load(file)
    num = 0
    File.open("movies.txt", "r") do |movie|
      movie.each_line do |num|
        num +=1
      end
    end
  end


end
