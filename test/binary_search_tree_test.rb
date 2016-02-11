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
  meta booger: true
  def test_insert_adds_information_to_tree
    tree = BinarySearchTree.new
    tree.insert(8, "The Fonz")
    assert_equal "The Fonz", tree.root_node.movie
    assert_equal 8, tree.root_node.score
  end
meta wawa: true
  def test_depth_exists
    tree = BinarySearchTree.new
    tree.insert(8, "The Fonz")
    assert_equal 0, tree.root_node.depth
  end
meta ly: true
  def test_depth_exists_with_more_than_one_node
    tree = BinarySearchTree.new
    tree.insert(8, "The Fonz")
    tree.insert(16, "Friends")
    assert_equal 1, tree.root_node.right_link.depth
  end
meta wa: true
  def test_depth_works_with_longer_trees_to_right
    tree = BinarySearchTree.new
    tree.insert(8, "The Fonz")
    tree.insert(16, "Friends")
    tree.insert(34, "My So Called Life")
    assert_equal 2, tree.root_node.right_link.right_link.depth
  end
meta ma: true
  def test_depth_works_with_links_to_left
    tree = BinarySearchTree.new
    tree.insert(8, "The Fonz")
    tree.insert(6, "Friends")
    tree.insert(34, "My So Called Life")
    assert_equal 1, tree.root_node.left_link.depth
  end
meta pop: true
  def test_depth_works_with_longer_trees_to_left
    tree = BinarySearchTree.new
    tree.insert(8, "The Fonz")
    tree.insert(6, "Friends")
    tree.insert(4, "My So Called Life")
    assert_equal 2, tree.root_node.left_link.left_link.depth
  end
meta bigger: true
    def test_depth_works_with_longer_trees_to_left
      tree = BinarySearchTree.new
      tree.insert(8, "The Fonz")
      tree.insert(6, "Friends")
      tree.insert(4, "My So Called Life")
      tree.insert(3, "Happy Days")
      tree.insert(2, "Chocolate")
      assert_equal 4, tree.root_node.left_link.left_link.left_link.left_link.depth
    end

end

class InsertTest < Minitest::Test

meta billy: true
  def test_insert_returns_depth_of_new_node
    tree = BinarySearchTree.new
    assert_equal 0, tree.insert(61, "Bill & Ted's Excellent Adventure")
  end

meta depth: true

  def test_insert_works_with_two_nodes
    tree = BinarySearchTree.new
    assert_equal 0, tree.insert(61, "Bill & Ted's Excellent Adventure")
    assert_equal 1, tree.insert(16, "Johnny English")
  end

  meta boom: true
  def test_insert_returns_correct_depth_for_multiple_nodes_on_same_depth
    tree = BinarySearchTree.new
    assert_equal 0, tree.insert(61, "Bill & Ted's Excellent Adventure")
    assert_equal 1, tree.insert(16, "Johnny English")
    assert_equal 1, tree.insert(92, "Sharknado 3")
  end
meta bean: true
  def test_insert_returns_correct_depth_for_depth_of_two
    tree = BinarySearchTree.new
    assert_equal 0, tree.insert(61, "Bill & Ted's Excellent Adventure")
    assert_equal 1, tree.insert(16, "Johnny English")
    assert_equal 2, tree.insert(20, "THE LION KING")
    # assert_equal 1, tree.insert(92, "Sharknado 3")
    # bat=  tree.insert(99, "Batman")
    # binding.pry
    # assert_equal 2, bat
  end
meta bow: true
  def test_insert_returns_correct_depth_if_heavily_skewed_to_right
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(63, "Titanic")
    tree.insert(92, "Selena")
    tree.insert(94, "Mickey Mouse")
    a = tree.insert(99, "Aladdin")
    assert_equal 4, a
  end

  def test_insert_returns_correct_depth_if_heavily_skewed_to_left
    tree = BinarySearchTree.new
    tree.insert(95, "Bill & Ted's Excellent Adventure")
    tree.insert(93, "Titanic")
    tree.insert(92, "Selena")
    tree.insert(90, "Mickey Mouse")
    assert_equal 4, tree.insert(89, "Aladdin")
  end

meta shark: true
  def test_insert_adds_node_to_right_if_higher
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

  def test_depth_of_returns_nil_if_tree_empty
    tree = BinarySearchTree.new
    assert_equal nil, tree.depth_of(nil)
  end

  def test_depth_of_will_return_nil_for_non_existing_value
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    assert_equal nil, tree.depth_of(45)
  end

meta bst: true
  def test_depth_finds_the_depth_of_tree
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    assert_equal 1, tree.depth_of(92)
  end

  def test_depth_works_with_deeper_node
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    assert_equal 2, tree.depth_of(50)
  end

  def test_depth_of_works_with_skewed_to_right_trees
    tree = BinarySearchTree.new
    tree.insert(50, "Walking on a Cloud")
    tree.insert(43, "Milk")
    tree.insert(72, "Discoman")
    tree.insert(87, "Mrs. Doubtfire")
    tree.insert(89, "Tootsie")
    tree.insert(90, "Breakfast Club")
    tree.insert(91, "Pretty in Pink")
    tree.insert(92, "Say Anything")
  end

  def test_depth_of_works_with_skewed_to_left_trees
    tree = BinarySearchTree.new
    tree.insert(90, "Walking on a Cloud")
    tree.insert(83, "Milk")
    tree.insert(72, "Discoman")
    tree.insert(87, "Mrs. Doubtfire")
    tree.insert(8, "Tootsie")
    tree.insert(9, "Breakfast Club")
    tree.insert(11, "Pretty in Pink")
    tree.insert(2, "Say Anything")
  end
end

class MaxAndMinTest < Minitest::Test
meta nilly: true
  def test_max_returns_nil_for_empty_tree
    tree = BinarySearchTree.new
    hash = {nil => 0}
    assert_equal hash, tree.max
  end
meta max: true
  def test_max_finds_highest_movie_information
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    hash = {"Sharknado 3" =>92}
    assert_equal hash, tree.max
  end

  def test_max_finds_highest_movie_on_skewed_to_left_tree
    tree = BinarySearchTree.new
    tree.insert(90, "Walking on a Cloud")
    tree.insert(83, "Milk")
    tree.insert(72, "Discoman")
    tree.insert(87, "Mrs. Doubtfire")
    tree.insert(8, "Tootsie")
    tree.insert(9, "Breakfast Club")
    tree.insert(11, "Pretty in Pink")
    tree.insert(2, "Say Anything")
    hash = {"Walking on a Cloud" => 90}
    assert_equal hash, tree.max
  end

  def test_max_finds_highest_movie_on_skewed_to_right_tree
    tree = BinarySearchTree.new
    tree.insert(50, "Walking on a Cloud")
    tree.insert(43, "Milk")
    tree.insert(72, "Discoman")
    tree.insert(87, "Mrs. Doubtfire")
    tree.insert(89, "Tootsie")
    tree.insert(90, "Breakfast Club")
    tree.insert(91, "Pretty in Pink")
    tree.insert(92, "Say Anything")
    hash = {"Say Anything" => 92}
    assert_equal hash, tree.max
  end

  def test_max_works_with_very_large_tree
    tree = BinarySearchTree.new
    tree.insert(72, "Discoman")
    tree.insert(87, "Mrs. Doubtfire")
    tree.insert(89, "Tootsie")
    tree.insert(90, "Breakfast Club")
    tree.insert(8, "Mystical Pizza")
    tree.insert(50, "Walking on a Cloud")
    tree.insert(43, "Milk")
    tree.insert(92, "Say Anything")
    tree.insert(19, "Sisterhood of the Travel")
    tree.insert(9, "Ski School")
    tree.insert(11, "Ski School 2")
    tree.insert(2, "Beauty and the Beast")
    tree.insert(91, "Pretty in Pink")
    tree.insert(83, "Wizards")
    tree.insert(7, "Citizen Kane")
    tree.insert(1, "Chocolat")
    hash = {"Say Anything" => 92}
    assert_equal hash, tree.max
  end
meta min: true
  def test_min_finds_lowest_movie_information
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    hash = {"Johnny English" =>16}
    assert_equal hash, tree.min
  end

  def test_min_finds_highest_movie_on_skewed_to_left_tree
    tree = BinarySearchTree.new
    tree.insert(90, "Walking on a Cloud")
    tree.insert(83, "Milk")
    tree.insert(72, "Discoman")
    tree.insert(87, "Mrs. Doubtfire")
    tree.insert(8, "Tootsie")
    tree.insert(9, "Breakfast Club")
    tree.insert(11, "Pretty in Pink")
    tree.insert(2, "Say Anything")
    hash = {"Say Anything" => 2}
    assert_equal hash, tree.min
  end

  def test_min_finds_highest_movie_on_skewed_to_right_tree
    tree = BinarySearchTree.new
    tree.insert(50, "Walking on a Cloud")
    tree.insert(43, "Milk")
    tree.insert(72, "Discoman")
    tree.insert(87, "Mrs. Doubtfire")
    tree.insert(89, "Tootsie")
    tree.insert(90, "Breakfast Club")
    tree.insert(91, "Pretty in Pink")
    tree.insert(92, "Say Anything")
    hash = {"Milk" => 43}
    assert_equal hash, tree.min
  end
end

class SortedArrayTest < Minitest::Test

  def test_sort_returns_emptyish_array_for_nil_tree
    tree = BinarySearchTree.new
    empty_array = []
    assert_equal empty_array, tree.sort
  end

meta sort: true
  def test_sort_returns_correct_array_for_single_tree
    tree = BinarySearchTree.new
    tree.insert(92, "Say Anything")
    array = [{"Say Anything" => 92}]
    assert_equal array, tree.sort
  end
meta pink: true
  def test_sort_returns_correct_array_for_two_node_tree
    tree = BinarySearchTree.new
    tree.insert(90, "Breakfast Club")
    tree.insert(91, "Pretty in Pink")
    array = [{"Breakfast Club" => 90}, {"Pretty in Pink" => 91}]
    assert_equal array, tree.sort
  end
meta break: true
  def test_sort_returns_ascending_array_for_two_node_tree
    tree = BinarySearchTree.new
    tree.insert(90, "Breakfast Club")
    tree.insert(9, "Big Fish")
    array = [{"Big Fish" => 9}, {"Breakfast Club" => 90}, ]
    assert_equal array, tree.sort
  end

  def test_sort_with_three_nodes
    tree = BinarySearchTree.new
    tree.insert(90, "Breakfast Club")
    tree.insert(9, "Big Fish")
    tree.insert(14, "Spice World")
    array = [{"Big Fish" => 9}, {"Spice World" => 14}, {"Breakfast Club" => 90}, ]
    assert_equal array, tree.sort
  end

  def test_sort_returns_array_of_data_in_ascending_order
    tree = BinarySearchTree.new
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(61, "Hannibal Buress: Animal Furnace")
    sorted_array = [{"Johnny English" =>16},
    {"Hannibal Buress: Animal Furnace" =>61}, {"Sharknado 3" =>92}]
    assert_equal sorted_array, tree.sort
  end
meta megamega: true

  def test_sort_returns_array_with_long_tree
    tree = BinarySearchTree.new
    tree.insert(90, "Breakfast Club")
    tree.insert(8, "Mystic Pizza")
    tree.insert(50, "Walking on a Cloud")
    tree.insert(43, "Milk")
    tree.insert(92, "Say Anything")
    tree.insert(19, "Sisterhood of the Travel")
    tree.insert(9, "Ski School")
    tree.insert(11, "Ski School 2")
    tree.insert(2, "Beauty and the Beast")
    tree.insert(91, "Pretty in Pink")
    tree.insert(23, "Wizards")
    tree.insert(7, "Citizen Kane")
    tree.insert(1, "Chocolat")
    sorted_array = [{"Chocolat" => 1}, {"Beauty and the Beast" => 2}, {"Citizen Kane" => 7}, {"Mystic Pizza" => 8}, {"Ski School" => 9}, {"Ski School 2" => 11}, {"Sisterhood of the Travel" => 19}, {"Wizards" => 23}, {"Milk" => 43}, {"Walking on a Cloud" => 50}, {"Breakfast Club" => 90}, {"Pretty in Pink" => 91}, {"Say Anything" => 92} ]
    assert_equal sorted_array, tree.sort
  end
end

class LoadTest < Minitest::Test

meta load:true
  def test_load_reads_file_and_returns_number_of_movies
    tree = BinarySearchTree.new
    assert_equal 100, tree.load("movies.txt")
  end
meta arma: true
  def test_load_reads_file_and_creates_tree
    tree = BinarySearchTree.new
    assert_equal 100, tree.load("movies.txt")
    assert_equal " Hannibal Buress: Animal Furnace", tree.root_node.movie
    assert_equal " Hannibal Buress: Comedy Camisado", tree.root_node.right_link.movie
  end
end

class HealthTest < Minitest::Test
  meta none: true
  def test_health_returns_nil_for_non_existant_depth
    tree = BinarySearchTree.new
    tree.insert(8, "Mystic Pizza")
    assert_equal [], tree.health(2)
  end

  def test_health_gives_nil_if_empty_tree
    tree = BinarySearchTree.new
    assert_equal [], tree.health(2)
  end
meta mystic: true
  def test_health_gives_score_information_for_one_node_tree
    tree = BinarySearchTree.new
    tree.insert(8, "Mystic Pizza")
    assert_equal 8, tree.health(0)[0][0]
  end

meta pizza: true
  def test_health_gives_information_for_one_node_tree
    tree = BinarySearchTree.new
    tree.insert(8, "Mystic Pizza")
    assert_equal [[8, 1, 100]], tree.health(0)
  end
meta sista: true
  def test_health_gives_information_for_two_node_tree
    tree = BinarySearchTree.new
    tree.insert(8, "Mystic Pizza")
    tree.insert(19, "Sisterhood of the Travel")
    assert_equal [[8, 2, 100]], tree.health(0)
  end
meta wowww: true
  def test_score_is_returned_for_multi_node_tree
    tree = BinarySearchTree.new
    tree.insert(98, "Animals United")
    tree.insert(58, "Armageddon")
    tree.insert(48, "Armadon")
    tree.insert(19, "Sisterhood of the Travel")
    tree.insert(9, "Ski School")
    assert_equal 9, tree.health(4)[0][0]
  end

meta wcww: true
  def test_score_is_returned_for_left_right_tree
    tree = BinarySearchTree.new
    tree.insert(98, "Animals United")
    tree.insert(38, "Armageddon")
    tree.insert(48, "Armadon")
    tree.insert(19, "Sisterhood of the Travel")
    tree.insert(9, "Ski School")
    assert_equal [[9, 1, 20]], tree.health(3)
  end
meta ar: true
  def test_score_is_returned_for_two_node_tree
    tree = BinarySearchTree.new
    tree.insert(98, "Animals United")
    tree.insert(58, "Armageddon")
    tree.insert(48, "Armadon")
    assert_equal 48, tree.health(2)[0][0]
  end

meta lylas: true
  def test_score_is_returned_for_two_node_tree_to_right
    tree = BinarySearchTree.new
    tree.insert(98, "Animals United")
    tree.insert(108, "Armageddon")
    tree.insert(120, "Armagdon")
    tree.insert(12, "Argdon")
    assert_equal [[12, 1, 25], [108, 2, 75]], tree.health(1)
  end
meta child: true
  def test_health_returns_correct_score_and_child_num
    tree = BinarySearchTree.new
    tree.insert(98, "Animals United")
    assert_equal [[98, 1, 100]], tree.health(0)
  end
meta inform: true
  def test_all_returns_all_information
    tree = BinarySearchTree.new
    tree.insert(98, "Animals United")
    assert_equal 1, tree.total_elements
  end
meta all: true
  def test_all_returns_all_information_for_large_tree
    tree = BinarySearchTree.new
    tree.insert(98, "Animals United")
    tree.insert(58, "Armageddon")
    tree.insert(36, "Bill & Ted's Bogus Journey")
    tree.insert(93, "Bill & Ted's Excellent Adventure")
    tree.insert(86, "Charlie's Angels")
    tree.insert(38, "Charlie's Country")
    tree.insert(69, "Collateral Damage")
    assert_equal 7, tree.total_elements
end
meta mega_health: true
  def test_health_gives_accurate_report_for_tree
    skip
    tree = BinarySearchTree.new
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
    assert_equal report0, tree.health(0)
    assert_equal report_1, tree.health(1)
    assert_equal report_2, tree.health(2)
  end
end
