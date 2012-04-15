require File.join(File.dirname(__FILE__), %w{ .. test_consistent_hashing})

class TestVirtualPoint < ConsistentHashing::TestCase
  def setup
    @node = {'host' => '192.168.1.101'}
    @point = ConsistentHashing::VirtualPoint.new(@node, "1")
  end

  def test_init
    assert_equal @node, @point.node
    assert_equal 1, @point.index
  end

  def test_set_index
    @point.index = "2"
    assert_equal 2, @point.index
  end
end
