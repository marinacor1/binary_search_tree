require 'pry'
require_relative 'node'
require_relative 'recursions'
require_relative 'health_auxiliaries'
require_relative 'insert_auxiliaries'
require_relative 'max_auxiliaries'
require_relative 'min_auxiliaries'
require_relative 'sort_auxiliaries'
require_relative 'include_auxiliaries'


class BinarySearchTree
  include Recursions, HealthAuxiliaries, IncludeAuxiliaries, InsertAuxiliaries, MaxAuxiliaries, MinAuxiliaries, SortAuxiliaries

  attr_accessor :root_node, :max_node, :sorted_array, :previous_depth, :tree

  def initialize
    @max_node = 0
    @min_node = 100
    @sorted_array = []
    @children = 0
    @tree = []
  end

  def insert(score, movie, node = @root_node)
    movie_collection_information(score, movie)
    base_depth(node)
    insert_recursion(score, movie, node)
    @previous_depth
  end

  def movie_collection_information(score, movie)
    movie_info = {}
    movie_collection = []
    movie_info[movie] = score
    movie_collection << movie_info
  end

  def include?(value, node = @root_node)
    if node.nil? ;  false
    elsif value == node.score ;  true
    elsif value < node.score
      less_value(value, node)
    else
      greater_value(value, node)
    end
  end

  def depth_of(score, node = @root_node)
    if node.nil? ; nil
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
    max_recursion(node)
    maximum[@max_movie] = @max_node
    maximum
  end

  def min(node = @root_node)
    minimum = {}
    min_recursion(node)
    minimum[@min_movie] = @min_node
    minimum
  end

  def load(file)
    movies = []
    File.open("./lib/movies.txt", "r") do |movie|
      movie.each_line do |title|
       movie_insert(movies, title)
      end
     movies.length
    end
  end

  def movie_insert(movies, title)
    movies << title
    score = title.split(",")[0].to_i
    movie = title.split(",")[1].chomp
    insert(score, movie)
  end

  def sort(node = @root_node)
    exceptions(node)
    sort_check(node)
    sorted_array.uniq
  end

  def health(depth, node = @root_node)
    if node.nil?;  []
    elsif depth == node.depth
     [[node.score, children_nodes(node), percent_children(node).to_i]]
    else
      health(depth, node.left_link) + health(depth, node.right_link)
    end
  end

end
