module Recursions
  def insert_recursion(score, movie, node)
    current_node = Node.new(score, movie)
    if node.nil?
      @root_node = Node.new(score, movie)
    elsif score < node.score && node.left_link
      depth_change(current_node)
      insert(score, movie, node.left_link)
    elsif score < node.score && node.left_link.nil?
      depth_change(current_node)
      node.left_link = current_node
    elsif score > node.score && node.right_link
      depth_change(current_node)
      insert(score, movie, node.right_link)
    else score > node.score && node.right_link.nil?
      depth_change(current_node)
      node.right_link = current_node
    end
  end

  def depth_change(current_node)
    current_node.depth = (@previous_depth += 1)
    @previous_depth = current_node.depth
  end

  def max_continued(node)
    @max_node = node.score
    max(node.right_link)
  end

  def max_switch(node)
    @max_node = node.score
    @max_movie = node.movie
  end

  def min_continued(node)
    @min_node = node.score
    min(node.left_link)
  end

  def min_switch(node)
    @min_node = node.score
    @min_movie = node.movie
  end

  def max_recursion(node)
    if node.nil?
      nil
    elsif node.score < @max_node
      @max_node
    elsif node.score > @max_node && node.right_link
      max_continued(node)
    else node.score > @max_node && node.right_link.nil?
      max_switch(node)
    end
  end

  def min_recursion(node)
    if node.nil?
      nil
    elsif node.score > @min_node
      @min_node
    elsif node.score < @min_node && node.left_link
      min_continued(node)
    else node.score < @min_node && node.left_link.nil?
      min_switch(node)
    end
  end

  def base_depth(node)
    if node == @root_node
      @previous_depth = 0
    end
  end

  def less_value(value, node)
    if node.left_link.nil?
      false
    else include?(value, node.left_link)
    end
  end

  def greater_value(value ,node)
    if node.right_link.nil?
      false
    else include?(value, node.right_link)
    end
  end

  def exceptions(node)
    return [] if @root_node.nil?
    return [get_data(@root_node)] if no_childs(@root_node)
    return sorted_array << get_data(node) if no_childs(@root_node)
  end

  def child_check(node)
    if self.nil?
      @children = nil
    elsif no_childs(node)
      @children
    elsif node.right_link
      child_right(node)
    else
      child_left(node)
    end
  end

  def sort_check(node)
    if node.nil?
      sorted_array
    else
      link_check(node)
      sorted_array << get_data(node)
      right_check(node)
    end
  end

  def link_check(node)
    if node.left_link
      sort(node.left_link)
    elsif
      sorted_array << get_data(node)
      right_check(node)
    end
  end

  def right_check(node)
    if node.right_link
      sort(node.right_link)
    end
  end

  def no_childs(node = @root_node)
    node.left_link.nil? && node.right_link.nil?
  end

  def get_data(node)
    sorts = {}
    sorts[node.movie] = node.score
    sorts
  end

  def tree_initial_check(node)
    if node.nil?
      @tree
    else
      tree_search(node)
    end
  end

  def tree_search(node)
    tree_link_check(node)
    @tree << node
    right_check(node)
  end

  def tree_link_check(node)
    if node.left_link
      sort(node.left_link)
    elsif
      @tree << node
      right_check(node)
    end
  end

  def child_right(node)
    right_link_search(node)
    @children += 1
    children_nodes(node.right_link)
  end

  def child_left(node)
    left_link_search(node)
    @children += 1
    children_nodes(node.left_link)
  end

  def maximum_child
    if @children == total_elements
      @children
    else
      @children + 1
    end
  end




end
