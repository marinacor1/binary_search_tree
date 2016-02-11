module MaxAuxiliaries
  def max_continued(node)
    @max_node = node.score
    max(node.right_link)
  end

  def max_switch(node)
    @max_node = node.score
    @max_movie = node.movie
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


end
