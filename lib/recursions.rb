module Recursions

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

  def child_check(node)
    if all.nil?
      @children = nil
    elsif no_childs(node)
      @children
    elsif node.right_link
      child_right(node)
    else
      child_left(node)
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




end
