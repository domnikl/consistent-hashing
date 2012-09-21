require 'avl_tree'

module ConsistentHashing
  class AVLTree < ::AVLTree

    def minimum_pair()
      # Return the key with the smallest key value.
      return nil if @root.empty?

      current_node = @root
      while not current_node.left.empty?
        current_node = current_node.left
      end

      [current_node.key, current_node.value]
    end

    def next_gte_pair(key)
      # Returns the key/value pair with a key that follows the provided key in
      # sorted order.
      node = next_gte_node(@root, key)
      [node.key, node.value] if not node.empty?
    end

    protected

    def next_gte_node(node, key)
      return AVLTree::Node::EMPTY if node.empty?

      if key < node.key
        # The current key qualifies as after the provided key. However, we need
        # to check the tree on the left to see if there's a key in there also
        # greater than the provided key but less than the current key.
        after = next_gte_node(node.left, key)
        after = node if after.empty?
      elsif key > node.key
        # The current key will not be after the provided key, but something
        # in the right branch maybe. Check the right branch for the first key
        # larger than our value.
        after = next_gte_node(node.right, key)
      elsif node.key == key
        # An exact match qualifies as the next largest node.
        after = node
      end

      return after
    end
  end
end
