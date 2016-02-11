module SortAuxiliaries
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

  def get_data(node)
    sorts = {}
    sorts[node.movie] = node.score
    sorts
  end

  def no_childs(node = @root_node)
    node.left_link.nil? && node.right_link.nil?
  end


end
