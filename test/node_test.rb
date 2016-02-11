require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/node'

class NodeTest < Minitest::Test
  def test_node_is_instance_of_node_class
    node = Node.new(30, "W")
    assert node.instance_of? Node
  end

  def test_node_creates_nil_links
    node = Node.new(90, "Lost in Translation")
    assert_equal nil, node.right_link
    assert_equal nil, node.left_link
  end

  def test_node_creates_instavars_of_score_movie
    node = Node.new(90, "Lost in Translation")
    assert_equal "Lost in Translation", node.movie
    assert_equal 90, node.score
  end

end
