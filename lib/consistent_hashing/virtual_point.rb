module ConsistentHashing

  # Public: represents a virtual point on the hash ring
  #
  class VirtualPoint
    attr_reader :node, :index

    def initialize(node, index)
      @node = node
      @index = index.to_i
    end

    # Public: set a new index for the virtual point. Useful if the point gets duplicated
    def index=(index)
      @index = index.to_i
    end
  end
end