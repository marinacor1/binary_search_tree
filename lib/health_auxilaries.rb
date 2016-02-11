require_relative 'binary_search_tree'

module HealthAuxilaries
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
     child_right(node)
   else
     child_left(node)
   end
  end


  def no_childs(node = @root_node)
    node.left_link.nil? && node.right_link.nil?
  end

  def maximum_child
    if @children == total_elements
      @children
    else
      @children + 1
    end
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
