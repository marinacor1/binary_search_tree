module IncludeAuxiliaries
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


end
