require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/binary_search_tree'

class BinarySearchTreeTest < Minitest::Test
  def setup
  tree = BinarySearchTree.new
  tree.insert(61, "Bill & Ted's Excellent Adventure")
  tree.insert(16, "Johnny English")
  tree.insert(92, "Sharknado 3")
  tree.insert(50, "Hannibal Buress: Animal Furnace")
  end

  def test_tree_is_instance_of_bst_class
    tree = BinarySearchTree.new
    assert tree.instance_of? BinarySearchTree
  end

  def test_tree_is_empty_initially
    tree = BinarySearchTree.new
    assert_equal nil, tree.root_node
  end

  def test_root_node_has_no_right_or_left_link
    tree = BinarySearchTree.new
    tree.insert(8, "the fonz")
    assert_equal nil, tree.root_node.right_link
    assert_equal nil, tree.root_node.left_link
  end

  def test_root_node_has_current_right_and_left_links
   skip
   tree = BinarySearchTree.new
   tree.insert(8, "The Fonz")
   tree.insert(4, "The Secret Garden")
   tree.insert(16, "The Immaculate Collection")
   assert_equal "The Immaculate Collection", tree.root_node.right_link.key
   assert_equal "The Secret Garden", tree.root_node.left_link.key
 end

  def test_insert_adds_information_to_tree
    skip
    tree = BinarySearchTree.new
    tree.insert(8, "the fonz")
    assert_equal "the fonz", tree.root_node.key
    assert_equal 8, tree.root_node.value
  end

  def test_insert_adds_node_with_data
    skip
    tree = BinarySearchTree.new
    assert_equal 0, tree.length
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    assert_equal 1, tree.length
  end

  def test_insert_returns_depth_of_new_node
    skip
    tree = BinarySearchTree.new
    assert_equal 0, tree.insert(61, "Bill & Ted's Excellent Adventure")
  end

  def test_insert_adds_node_to_non_empty_tree
    skip
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    assert_equal 1, tree.length
    tree.insert(16, "Johnny English")
    assert_equal 2, tree.length
  end

  def test_insert_adds_node_to_left_if_lower
    skip
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    assert_equal 1, tree.insert(92, "Sharknado 3")
  end

  def test_insert_adds_node_to_right_if_higher
    skip
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    assert_equal 2, tree.insert(50, "Hannibal Buress: Animal Furnace")
  end

  def test_include_returns_true_if_value_found
    skip
    setup
    assert tree.include?(16)
  end

  def test_include_works_with_different_value
    skip
    setup
    assert tree.include?(50)
  end

  def test_include_returns_false_if_value_does_not_exist
    skip
    setup
    assert tree.include?(72)
  end

  def test_include_returns_false_if_value_does_not_exist_again
    skip
    setup
    assert tree.include?(71)
  end

  def test_depth_finds_the_depth_of_tree
    skip
    setup
    assert_equal 1, tree.depth_of(92)
  end

  def test_depth_works_with_deeper_node
    skip
    setup
    assert_equal 2, tree.depth_of(50)
  end

  def test_max_finds_highest_movie_information
    skip
    setup
    hash = {"Sharknado 3" =>92}
    assert_equal hash, tree.max
  end

  def test_min_finds_lowest_movie_information
    skip
    setup
    hash = {"Johnny English" =>16}
    assert_equal hash, tree.min
  end

  def test_sort_returns_array_of_data_in_ascending_order
    skip
    setup
    sorted_array = [{"Johnny English" =>16},
    {"Hannibal Buress: Animal Furnace" =>61}, {"Sharknado 3" =>92}]
    assert_equal sorted_array, tree.sort
  end

  def test_load_reads_file_and_returns_number_of_movies
    skip
    assert_equal 26, tree.load('movies.txt')
  end

  def test_health_gives_accurate_report_for_tree
    skip
    tree.insert(98, "Animals United")
    tree.insert(58, "Armageddon")
    tree.insert(36, "Bill & Ted's Bogus Journey")
    tree.insert(93, "Bill & Ted's Excellent Adventure")
    tree.insert(86, "Charlie's Angels")
    tree.insert(38, "Charlie's Country")
    tree.insert(69, "Collateral Damage")
    report0 = [[98, 7, 100]]
    report_1 = [[58, 6, 85]]
    report_2 = [[36, 2, 28], [93, 3, 42]]
    #why is this two nested trees
    assert_equal report0, tree.health(0)
    assert_equal report_1, tree.health(1)
    assert_equal report_2, tree.health(2)
  end
end
