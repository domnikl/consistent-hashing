require File.join(File.dirname(__FILE__), %w{ .. test_consistent_hashing})

class TestRing < ConsistentHashing::TestCase
  def setup
    @ring = ConsistentHashing::Ring.new %w{A B C}

    @examples = {
      "A" => "foobar",
      "B" => "123",
      "C" => "baz",
      "not_found" => 0
    }
  end

  def test_init
    ring = ConsistentHashing::Ring.new
    assert_equal 0, ring.length
  end

  def test_length
    ring = ConsistentHashing::Ring.new([], 3)
    assert_equal 0, ring.length

    ring << "A" << "B"
    assert_equal 6, ring.length
  end

  def test_get_node
    assert_equal "A", @ring.point_for(@examples["A"]).node
    assert_equal "B", @ring.point_for(@examples["B"]).node
    assert_equal "C", @ring.point_for(@examples["C"]).node
  end

  # should fall back to the first node, if key > last node
  def test_get_node_fallback_to_first
    ring = ConsistentHashing::Ring.new ["A"], 1

    point = ring.point_for(@examples["not_found"])

    assert_equal "A", point.node
    assert_not_equal 0, point.index
  end

  # if I remove node C, all keys previously mapped to C should be moved clockwise to
  # the next node. That's a virtual point of B here
  def test_remove_node
    @ring.delete("C")
    assert_equal "B", @ring.point_for(@examples["C"]).node
  end

  def test_point_for
    assert_equal "C", @ring.node_for(@examples["C"])
  end

  def test_nodes
    nodes = @ring.nodes

    assert_equal 3, nodes.length
    assert_not_equal nil, nodes.index("A")
    assert_not_equal nil, nodes.index("B")
    assert_not_equal nil, nodes.index("C")
  end

  def test_points
    ring = ConsistentHashing::Ring.new %w{A B C}, 3

    points = ring.points
    assert_equal 9, points.length
  end
end
