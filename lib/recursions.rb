module Recursions

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

  def right_link_search(node = @root_node)
   all.map {|element| element.right_link }
  end

  def left_link_search(node = @root_node)
    all.map {|element| element.left_link }
  end

end
