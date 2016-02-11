require 'pry'
require_relative 'node'
require_relative 'recursions'

class BinarySearchTree
  include Recursions

  attr_accessor :root_node, :max_node, :sorted_array, :movie_collection, :previous_depth, :tree

  def initialize
    @root_node = root_node
    @max_node = 0
    @min_node = 100
    @sorted_array = []
    @tree = []
    @children = 0
  end

  def insert(score, movie, node = @root_node)
    movie_collection_information(score, movie)
    base_depth(node)
    current_node = Node.new(score, movie)
    if node.nil?
      @root_node = Node.new(score, movie)
      current_node.depth = 0
    elsif score < node.score && node.left_link
      current_node.depth = (@previous_depth +=1)
      @previous_depth = current_node.depth
      insert(score, movie, node.left_link)
    elsif score < node.score && node.left_link.nil?
      current_node.depth = (@previous_depth += 1)
      @previous_depth = current_node.depth
      node.left_link = current_node
    elsif score > node.score && node.right_link
      current_node.depth = (@previous_depth += 1)
      @previous_depth = current_node.depth
      insert(score, movie, node.right_link)
    else score > node.score && node.right_link.nil?
      current_node.depth = (@previous_depth += 1)
      @previous_depth = current_node.depth
      node.right_link = current_node
    end
    @previous_depth
  end

  def movie_collection_information(score, movie)
    movie_info = {}
    movie_collection = []
    movie_info[movie] = score
    movie_collection << movie_info
  end

  def include?(value, node = @root_node)
    if node.nil?
      false
    elsif value == node.score
      true
    elsif value < node.score
      less_value(value, node)
    else
      greater_value(value, node)
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
      min(node.left_link)
    else node.score < @min_node && node.left_link.nil?
      @min_node = node.score
      @min_movie = node.movie
    end
    minimum[@min_movie] = @min_node
    minimum
  end

  def load(file)
    movies = []
    File.open("./lib/movies.txt", "r") do |movie|
      movie.each_line do |title|
        movies << title
        score = title.split(",")[0].to_i
        movie = title.split(",")[1].chomp
        insert(score, movie)
      end
     movies.length
    end
  end

  def sort(node = @root_node)
    exceptions(node)
    sort_check(node)
    sorted_array.uniq
  end

  def all(node = @root_node)
    exceptions(node)
    tree_initial_check(node)
    tree.uniq
  end

  def total_elements(tree)
      tree.sort.count
  end

  def health(depth, node = @root_node)
    if node.nil?
      []
    elsif depth == node.depth
     [[node.score, children_nodes(node)]]
    else
      health(depth, node.left_link) + health(depth, node.right_link)
    end
  end

  def children_nodes(node)
   if all.nil?
     @children = nil
   elsif no_childs(node)
     @children
   elsif node.right_link
     right_link_search(node)
      @children += 1
      children_nodes(node.right_link)
   else
     left_link_search(node)
      @children += 1
      children_nodes(node.left_link)
   end
     @children + 1
   end

   def right_link_search(node = @root_node)
     all.map {|element| element.right_link }
   end

   def left_link_search(node = @root_node)
     all.map {|element| element.left_link }
   end

  def percent_children
    total =
    total = self.sort.count
    fraction = self.sort.count/total
    fraction * 100
  end

end
