require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/binary_search_tree'

class BinarySearchTreeTest < Minitest::Test

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
    tree.insert(8, "The Fonz")
    assert_equal nil, tree.root_node.right_link
    assert_equal nil, tree.root_node.left_link
  end

  def test_root_node_has_current_right_and_left_links
   tree = BinarySearchTree.new
   tree.insert(8, "The Fonz")
   tree.insert(4, "The Secret Garden")
   tree.insert(16, "The Immaculate Collection")
   assert_equal "The Immaculate Collection", tree.root_node.right_link.movie
   assert_equal "The Secret Garden", tree.root_node.left_link.movie
 end
meta boing: true
  def test_tree_can_create_multiple_right_links
    tree = BinarySearchTree.new
    tree.insert(50, "Walking on a Cloud")
    tree.insert(43, "Milk")
    tree.insert(72, "Discoman")
    tree.insert(87, "Mrs. Doubtfire")
    tree.insert(89, "Tootsie")
    tree.insert(90, "Breakfast Club")
    tree.insert(91, "Pretty in Pink")
    tree.insert(92, "Say Anything")
    assert_equal "Say Anything", tree.root_node.right_link.right_link.right_link.right_link.right_link.right_link.movie
  end
meta left: true
  def test_tree_can_create_multiple_left_links
    tree = BinarySearchTree.new
    tree.insert(50, "Walking on a Cloud")
    tree.insert(43, "Milk")
    tree.insert(72, "Discoman")
    tree.insert(25, "Jurassic World")
    tree.insert(23, "Aloha")
    tree.insert(22, "Titanic")
    tree.insert(21, "The Chipmunks")
    tree.insert(19, "Justin Bieber: World Tour")
    assert_equal "Justin Bieber: World Tour", tree.root_node.left_link.left_link.left_link.left_link.left_link.left_link.movie
  end

  def test_bst_can_create_complex_links
    tree = BinarySearchTree.new
    tree.insert(50, "Walking on a Cloud")
    tree.insert(43, "Milk")
    tree.insert(72, "Discoman")
    tree.insert(25, "Jurassic World")
    tree.insert(83, "Aloha")
    tree.insert(80, "Titanic")
    tree.insert(41, "The Chipmunks")
    tree.insert(19, "Justin Bieber: World Tour")
    tree.insert(49, "Addams Family")
    assert_equal "Addams Family", tree.root_node.left_link.right_link.movie
  end
end

class InsertTest < Minitest::Test
  def test_insert_adds_information_to_tree
    tree = BinarySearchTree.new
    tree.insert(8, "The Fonz")
    assert_equal "The Fonz", tree.root_node.movie
    assert_equal 8, tree.root_node.score
  end

  def test_insert_returns_depth_of_new_node
    tree = BinarySearchTree.new
    assert_equal 0, tree.insert(61, "Bill & Ted's Excellent Adventure")
  end

meta depth: true

  def test_insert_works_with_two_nodes
    skip
    tree = BinarySearchTree.new
    assert_equal 0, tree.insert(61, "Bill & Ted's Excellent Adventure")
    assert_equal 1, tree.insert(16, "Johnny English")
  end

  meta boom: true
  def test_insert_returns_correct_depth_for_multiple_depths
    skip
    tree = BinarySearchTree.new
    assert_equal 0, tree.insert(61, "Bill & Ted's Excellent Adventure")
    assert_equal 1, tree.insert(16, "Johnny English")
    assert_equal 1, tree.insert(92, "Sharknado 3")
  end
meta bow: true
  def test_insert_returns_correct_depth_if_heavily_skewed_to_right
    skip
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(63, "Titanic")
    tree.insert(92, "Selena")
    tree.insert(94, "Mickey Mouse")
    assert_equal 4, tree.insert(99, "Aladdin")
  end

  def test_insert_returns_correct_depth_if_heavily_skewed_to_left
    skip
    tree = BinarySearchTree.new
    tree.insert(95, "Bill & Ted's Excellent Adventure")
    tree.insert(93, "Titanic")
    tree.insert(92, "Selena")
    tree.insert(90, "Mickey Mouse")
    assert_equal 4, tree.insert(89, "Aladdin")
  end

meta shark: true
  def test_insert_adds_node_to_right_if_higher
    skip 
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    assert_equal 2, tree.insert(50, "Hannibal Buress: Animal Furnace")
  end
end

class IncludeTest < Minitest:: Test

  def test_include_returns_true_if_value_found
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    assert tree.include?(16)
  end

  def test_include_works_with_different_value
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    assert tree.include?(50)
  end

  def test_include_returns_true_if_value_exists
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    assert tree.include?(50)
  end

  def test_include_returns_false_if_value_does_not_exist_again
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    refute tree.include?(71)
  end

  def test_include_returns_true_for_non_setup_tree
    tree = BinarySearchTree.new
    tree.insert(50, "Walking on a Cloud")
    tree.insert(43, "Milk")
    tree.insert(72, "Discoman")
    assert tree.include?(43)
  end

  def test_include_returns_false_for_non_setup_tree
    tree = BinarySearchTree.new
    tree.insert(50, "Walking on a Cloud")
    tree.insert(43, "Milk")
    tree.insert(72, "Discoman")
    refute tree.include?(79)
  end

  def test_include_returns_true_for_long_uneven_tree
    tree = BinarySearchTree.new
    tree.insert(50, "Walking on a Cloud")
    tree.insert(43, "Milk")
    tree.insert(72, "Discoman")
    tree.insert(87, "Mrs. Doubtfire")
    tree.insert(89, "Tootsie")
    tree.insert(90, "Breakfast Club")
    tree.insert(91, "Pretty in Pink")
    tree.insert(92, "Say Anything")
    assert tree.include?(91)
  end

  def test_include_returns_true_for_long_uneven_tree_to_left
    tree = BinarySearchTree.new
    tree.insert(90, "Walking on a Cloud")
    tree.insert(83, "Milk")
    tree.insert(72, "Discoman")
    tree.insert(87, "Mrs. Doubtfire")
    tree.insert(8, "Tootsie")
    tree.insert(9, "Breakfast Club")
    tree.insert(11, "Pretty in Pink")
    tree.insert(2, "Say Anything")
    assert tree.include?(2)
  end

end

class Depth_ofTest < Minitest::Test

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
end

class MaxAndMinTest < Minitest::Test
meta nilly: true
  def test_max_returns_nil_for_empty_tree
    tree = BinarySearchTree.new
    assert_equal nil, tree.max
  end
meta max: true
  def test_max_finds_highest_movie_information
    skip
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    hash = {"Sharknado 3" =>92}
    assert_equal hash, tree.max
  end

  def test_max_finds_highest_movie_on_skewed_to_left_tree
    skip
  end

  def test_max_finds_highest_movie_on_skewed_to_right_tree
    skip
  end

  def test_min_finds_lowest_movie_information
    skip
    setup
    hash = {"Johnny English" =>16}
    assert_equal hash, tree.min
  end

  def test_min_finds_highest_movie_on_skewed_to_left_tree
    skip
  end

  def test_min_finds_highest_movie_on_skewed_to_right_tree
  skip
  end
end

class SortedArrayTest < Minitest::Test
  def test_sort_returns_array_of_data_in_ascending_order
    skip
    setup
    sorted_array = [{"Johnny English" =>16},
    {"Hannibal Buress: Animal Furnace" =>61}, {"Sharknado 3" =>92}]
    assert_equal sorted_array, tree.sort
  end
end

class LoadTest < Minitest::Test

  def test_load_reads_file_and_returns_number_of_movies
    skip
    assert_equal 26, tree.load('movies.txt')
  end
end

class HealthTest < Minitest::Test

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
