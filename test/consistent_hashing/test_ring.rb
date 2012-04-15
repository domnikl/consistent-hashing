require File.join(File.dirname(__FILE__), %w{ .. test_consistent_hashing})

class TestRing < ConsistentHashing::TestCase
  def setup
    @ring = ConsistentHashing::Ring.new %w{A B C}

    @examples = {
      "A" => "foobar",
      "B" => "123",
      "C" => "baz"
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
    assert_equal "A", @ring.node_for(@examples["A"])[0]
    assert_equal "B", @ring.node_for(@examples["B"])[0]
    assert_equal "C", @ring.node_for(@examples["C"])[0]
  end

  # if I remove node C, all keys previously mapped to C should be moved clockwise to
  # the next node. That's a virtual point of B here
  def test_remove_node
    @ring.delete("C")
    assert_equal "B", @ring.node_for(@examples["C"])[0]


    ring = ConsistentHashing::Ring.new
    ring << "192.168.1.101" << "192.168.1.102"

    puts ring.node_for("foobar")
  end

end