require_relative 'binary_search_tree'

module Health
  include Recursions

  def all(node = @root_node)
    exceptions(node)
    tree_initial_check(node)
    tree.uniq
  end

  def total_elements
    self.sort.count
  end

  def health(depth, node = @root_node)
    if node.nil?
      []
    elsif depth == node.depth
     [[node.score, children_nodes(node), percent_children(node).to_i]]
    else
      health(depth, node.left_link) + health(depth, node.right_link)
    end
  end

  def children_nodes(node)
    child_check(node)
    maximum_child
   end

  def right_link_search(node = @root_node)
   all.map {|element| element.right_link }
  end

  def left_link_search(node = @root_node)
    all.map {|element| element.left_link }
  end

  def percent_children(node)
    (children_nodes(node).to_f/ total_elements) * 100
  end

  def total_nodes(node = @root_node)
    node.count
  end

end
