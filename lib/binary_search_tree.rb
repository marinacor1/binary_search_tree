require 'pry'
require_relative 'node'
# require_relative 'movies.txt'

class BinarySearchTree
  attr_accessor :root_node, :left_count, :right_count, :max_node

  def initialize
    @root_node = root_node
    @left_count = 0
    @right_count = 0
    @max_node = 0
    @min_node = 0
    @last_depth = 0
    @previous_depth = 0
  end

  def insert(score, movie, node = @root_node, previous_depth = @previous_depth )
    @score = score
    @movie = movie
    current_node = Node.new(score, movie)
    if node.nil?
      @root_node = Node.new(score, movie)
      current_node.depth = 0
    elsif score < node.score && node.left_link
      current_node.depth = (previous_depth +=1)
      previous_depth = current_node.depth
      insert(score, movie, node.left_link, current_node.depth)
    elsif score < node.score && node.left_link.nil?
      current_node.depth = (previous_depth += 1)
      previous_depth = current_node.depth
      node.left_link = current_node
    elsif score > node.score && node.right_link
      current_node.depth = (previous_depth += 1)
      previous_depth = current_node.depth
      insert(score, movie, node.right_link, current_node.depth)
    else score > node.score && node.right_link.nil?
      current_node.depth = (previous_depth += 1)
      previous_depth = current_node.depth
      node.right_link = current_node
    end
    current_node.depth
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
    # binding.pry
    minimum = {}
    if node.nil?
      nil
    elsif node.score > @min_node
      @min_node
    elsif node.score < @min_node && node.left_link
      @min_node = node.score
      min(node.left_link)
    else node.score < @min_node && node.left_link.nil?
      @min_node = node.score
      @min_movie = node.movie
    end
    minimum[@min_movie] = @min_node
    minimum
  end

  def load(file)
    num = 0
    File.open("./lib/movies.txt", "r") do |movie|
      movie.each_line do |num|
        num +=1
      end
    num
    end
  end

  def sort
    sorted = []
    stats = {}
    stats[@movie] = @score
    sorted << stats
  end


end
