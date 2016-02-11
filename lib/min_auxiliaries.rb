module MinAuxiliaries

  def min_continued(node)
    @min_node = node.score
    min(node.left_link)
  end

  def min_switch(node)
    @min_node = node.score
    @min_movie = node.movie
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


end
