require 'programming_problems/binary_tree_node'

module ProgrammingProblems
  class BinaryTree
    attr_accessor :root

    def initialize
      self.root = nil
    end

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

    def find_value(val)
      find_value_node(root, val)
    end

    def find_parent(target)
      return if root == target
      node = root
      while node.left != target && node.right != target
        node = target.data < node.data ? node.left : node.right
      end
      node
    end

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
  end
end
