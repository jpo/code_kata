require 'programming_problems/binary_tree_node'

module ProgrammingProblems
  class BinaryTree
    attr_accessor :root

    def initialize
      @root = nil
    end

    def insert(val)
      @root = insert_node(@root, val)
    end

    def find_value(val)
      return find_value_node(@root, val)
    end

    def find_parent(target)
      return nil if @root == target
      node = @root
      while (node.left != target && node.right != target)
        if target.data < node.data
          node = node.left
        else
          node = node.right
        end
      end
      return node
    end

    def find_successor(target)
      successor = target.right
      if successor
        while successor.left
          successor = successor.left
        end
        return successor
      end
      begin
        target    = successor if successor
        successor = find_parent(target)
      end while successor && successor.right == target
      return successor
    end

    private

    def insert_node(node, val)
      return BinaryTreeNode.new(val) unless node
      if val < node.data
        node.left = insert_node(node.left, val)
      else
        node.right = insert_node(node.right, val)
      end
      return node
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
