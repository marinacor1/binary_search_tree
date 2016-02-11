module InsertAuxiliaries
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


  def base_depth(node)
    if node == @root_node
      @previous_depth = 0
    end
  end

end
