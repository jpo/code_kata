require 'programming_problems/binary_tree_node'

module ProgrammingProblems
  class BinaryTree
    attr_accessor :root

    def initialize
      self.root = nil
    end

    # Inserts a node in the tree with the given value.
    def insert(val)
      self.root = insert_node(root, val)
    end

    # Removes a given node from the tree.
    def remove(target)
      if target.left && target.right
        child       = find_successor(target)
        target.data = child.data
        remove(child)
      elsif target.left || target.right
        child        = target.left ? target.left : target.right
        target.data  = child.data
        target.left  = child.left
        target.right = child.right
      elsif root == target
        self.root = nil
      else
        parent = find_parent(target)
        if parent.left == target
          parent.left = nil
        else
          parent.right = nil
        end
      end
    end

    # Find and return the node in the tree whose value is equal to the given
    # value.
    def find_value(val)
      find_value_node(root, val)
    end

    # Find and return the parent of a given node in the tree.
    def find_parent(target)
      return if root == target
      node = root
      while node.left != target && node.right != target
        node = target.data < node.data ? node.left : node.right
      end
      node
    end

    # Find and return the successor of a given node in the tree.
    def find_successor(target)
      successor = target.right
      if successor
        successor = successor.left while successor.left
        return successor
      end
      loop do
        target    = successor if successor
        successor = find_parent(target)
        break unless successor && successor.right == target
      end
      successor
    end

    # Finds the path from the root to the given node
    def find_path(target)
      path = []
      node = root
      while node && (path.empty? || path.last != target)
        path << node
        node = target.data < node.data ? node.left : node.right
      end
      path
    end

    # Returns the number of nodes in the tree
    def size
      size_node(root)
    end

    # Returns the length of the longest path
    def depth
      depth_node(root)
    end

    # Indicates whether or not the left and right nodes have the same depth.
    def balanced?
      balanced_node?(root)
    end

    # Finds the lowest common ancestor from path to root
    def lowest_common_ancestor(x, y)
      x_path = find_path(x)
      y_path = find_path(y)
      lca    = nil
      x_path.zip(y_path) do |x_node, y_node|
        return lca unless x_node == y_node
        lca = x_node
      end
      lca
    end

    private

    def insert_node(node, val)
      return BinaryTreeNode.new(val) unless node
      if val < node.data
        node.left = insert_node(node.left, val)
      else
        node.right = insert_node(node.right, val)
      end
      node
    end

    def find_value_node(node, val)
      return node if !node || node.data == val
      if val < node.data
        return find_value_node(node.left, val)
      else
        return find_value_node(node.right, val)
      end
    end

    def size_node(node)
      return 0 unless node
      1 + size_node(node.left) + size_node(node.right)
    end

    def depth_node(node)
      return 0 unless node
      1 + [depth_node(node.left), depth_node(node.right)].max
    end

    def balanced_node?(node)
      return true unless node
      return false unless balanced_node?(node.left) && balanced_node?(node.right)
      (depth_node(node.right) - depth_node(node.left)).abs <= 1
    end
  end
end
