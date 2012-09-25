require File.join(File.dirname(__FILE__), %w{ .. test_consistent_hashing})

class TestAVLTree < ConsistentHashing::TestCase
  AVLTree = ConsistentHashing::AVLTree

  def test_minimum_returns_nil_if_empty
    tree = AVLTree.new
    assert_nil tree.minimum_pair
  end

  def test_minimum_returns_root_node_if_only_node
    tree = AVLTree.new
    tree[0]= 1
    assert_equal(tree.minimum_pair, [0, 1])
  end

  def test_minimum_returns_left_most_leaf
    tree = AVLTree.new
    1.upto(10) do |i|
      tree[i] = i.to_s
    end

    assert_equal(tree.minimum_pair, [1, "1"])
  end

  def test_next_gte_pair_returns_nil_if_empty
    tree = AVLTree.new
    assert_nil tree.next_gte_pair("some key")
  end

  def test_next_gte_pair_finds_exact_match_key
    tree = AVLTree.new
    1.upto(10) do |i|
      tree[i] = i.to_s
    end

    1.upto(10) do |i|
      assert_equal(tree.next_gte_pair(i), [i, i.to_s])
    end
  end

  def test_next_gte_pair_finds_slightly_larger_key
    tree = AVLTree.new
    (2..11).step(2) do |i|
      tree[i] = i.to_s
    end

    (1..10).step(2) do |i|
      assert_equal(tree.next_gte_pair(i), [i + 1, (i + 1).to_s])
    end
  end

  def test_next_gte_pair_returns_nil_if_no_larger_keys
    tree = AVLTree.new
    (2..11).step(2) do |i|
      tree[i] = i.to_s
    end

    assert_nil tree.next_gte_pair(12)
  end
end

