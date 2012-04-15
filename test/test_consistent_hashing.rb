$:.unshift(File.join(File.dirname(__FILE__), %w{.. lib}))
require 'consistent_hashing'
require 'test/unit'

module ConsistentHashing
  class TestCase < Test::Unit::TestCase
    def test_module
      assert_not_nil ConsistentHashing::VERSION
    end
  end
end