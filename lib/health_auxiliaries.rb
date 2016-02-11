require_relative 'binary_search_tree'

module HealthAuxiliaries
  include Recursions

  def all(node = @root_node)
    exceptions(node)
    tree_initial_check(node)
    tree.uniq
  end

  def total_elements
    self.sort.count
  end

  def children_nodes(node)
    child_exceptions(node)
    child_check(node)
    maximum_child
  end

  def child_exceptions(node)
    return [] if @root_node.nil?
    return @children if
    no_childs(@root_node)
    return @tree << @children if
    no_childs
  end

  def child_check(node)
   if self.nil?
     @children = nil
   elsif no_childs(node)
     @children
   elsif node.right_link
      @children +1
     child_right(node)
   else
     @children + 1
     child_left(node)
   end
  end

  def maximum_child
    if @children == total_elements
      @children
    else
      @children + 1
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


  def percent_children(node)
    (children_nodes(node).to_f/ total_elements) * 100
  end

  def total_nodes(node = @root_node)
    node.count
  end




end
