require 'helper'

module ProgrammingProblems
  class BinaryTreeTest < MiniTest::Test
    describe 'BinaryTree' do
      describe 'initialize' do
        it 'is empty' do
          tree = BinaryTree.new
          assert tree.root.nil?
        end
      end

      describe 'insert' do
        it 'inserts a node' do
          tree = BinaryTree.new
          tree.insert(1)
          assert_equal 1, tree.root.data
          assert tree.root.left.nil?
          assert tree.root.right.nil?
        end

        it 'sorts nodes on insert' do
          tree = BinaryTree.new
          [3, 1, 2, 4, 5].each { |n| tree.insert(n) }
          assert_equal 3, tree.root.data
          assert_equal 1, tree.root.left.data
          assert_equal 2, tree.root.left.right.data
          assert_equal 4, tree.root.right.data
          assert_equal 5, tree.root.right.right.data
        end
      end

      describe 'remove' do
        it 'deletes and replaces target with two children' do
          tree = BinaryTree.new
          [3, 2, 5, 1, 4, 6].each { |n| tree.insert(n) }
          tree.remove(tree.root.right)
          assert_equal 6, tree.root.right.data
          assert_equal 4, tree.root.right.left.data
          assert tree.root.right.right.nil?
        end

        it 'deletes and replaces target with one child' do
          tree = BinaryTree.new
          [3, 2, 5, 1, 4, 6].each { |n| tree.insert(n) }
          tree.remove(tree.root.left)
          assert_equal 1, tree.root.left.data
        end

        it 'deletes root when it has no children' do
          tree = BinaryTree.new
          tree.insert(1)
          tree.remove(tree.root)
          assert tree.root.nil?
        end

        it 'deletes target at end of a branch' do
          tree = BinaryTree.new
          [3, 2, 5, 1, 4, 6].each { |n| tree.insert(n) }
          tree.remove(tree.root.left.left)
          assert_equal 2, tree.root.left.data
          assert tree.root.left.left.nil?
          assert tree.root.left.right.nil?
        end
      end

      describe 'find_value' do
        it 'finds a node by value' do
          tree = BinaryTree.new
          (1..5).each { |n| tree.insert(n) }
          assert_equal 3, tree.find_value(3).data
          assert tree.find_value(0).nil?
        end
      end

      describe 'find_parent' do
        it 'finds the parent of a given node' do
          tree = BinaryTree.new
          (1..5).each { |n| tree.insert(n) }
          child = tree.root.right
          assert_equal 2, child.data
          assert_equal 1, tree.find_parent(child).data
        end
      end

      describe 'find_successor' do
        it 'finds the successor of a given node' do
          tree = BinaryTree.new
          (1..5).each { |n| tree.insert(n) }
          parent = tree.root
          assert_equal 1, parent.data
          assert_equal 2, tree.find_successor(parent).data
        end
      end

      describe 'size' do
        it 'is zero when tree is empty' do
          tree = BinaryTree.new
          assert_equal 0, tree.size
        end

        it 'counts the number of nodes in the tree' do
          tree = BinaryTree.new
          [3, 2, 5, 1, 4, 6].each { |n| tree.insert(n) }
          assert_equal 6, tree.size
        end
      end

      describe 'depth' do
        it 'is zero when tree is empty' do
          tree = BinaryTree.new
          assert_equal 0, tree.depth
        end

        it 'counts the length of the longest path' do
          tree = BinaryTree.new
          [3, 2, 5, 1, 4, 6].each { |n| tree.insert(n) }
          assert_equal 3, tree.depth
        end
      end
    end
  end
end
