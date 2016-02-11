require 'pry'
require_relative 'node'

class BinarySearchTree
  attr_accessor :root_node, :left_count, :right_count, :max_node, :previous_depth, :sorted_array

  def initialize
    @root_node = root_node
    @max_node = 0
    @min_node = 100
    @last_depth = 0
    @previous_depth = 0
    @movie_collection = []
    @sorted_array = []
    @sorts = {}
  end

  def insert(score, movie, node = @root_node)
    if node == @root_node
      @previous_depth = 0
    end
    movie_collection_information(score, movie)
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

  def movie_collection_information(score, movie)
    movie_info = {}
    movie_info[movie] = score
    @movie_collection << movie_info
  end

  # def sort
  #   sorted_array = @movie_collection.sort_by do |hash|
  #     hash.map do |k, v|
  #       v
  #     end
  #   end
  #   sorted_array.uniq
  # end

  def sort(node = @root_node)
    return [] if @root_node.nil?
    return [get_data(@root_node)] if @root_node.left_link.nil? && @root_node.right_link.nil?
    return @sorted_array << get_data(node) if node.left_link.nil? && node.right_link.nil?

    if node.nil?
      @sorted_array
    else
      if node.left_link
        sort(node.left_link)
      elsif
        @sorted_array << get_data(node)
        if node.right_link
          sort(node.right_link)
        end
      end
      @sorted_array << get_data(node)

      if node.right_link
        sort(node.right_link)
      end
    end
    @sorted_array.uniq
  end

  def get_data(node)
    sorts = {}
    sorts[node.movie] = node.score
    sorts
  end

  def all(node = @root_node)
    if node.nil?
      @sorted_array << node
    else
      sort(node.left_link)
      @sorted_array << node
      sort(node.right_link)
      @sorted_array << node
    end
  end

  # def sort
  #   sorted_array = @movie_collection.map do |hash|
  #     hash.map do |k, v|
  #       v
  #     end
  #   end
  #   sorted_array.uniq
  # end

  def health(depth, node = @root_node)
    if node.nil?
      []
    elsif depth == node.depth
     [[node.score, children_nodes]]
    else
      health(depth, node.left_link) + health(depth, node.right_link)
    end
  end

  def children_nodes
    @movie_collection.count
    # binding.pry
    # self.root_node.right_link + self.root_node.left_link + 1
  end

  def percent_children
    total =
    total = self.sort.count
    fraction = self.sort.count/total
    fraction * 100
  end





end
