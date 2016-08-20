require 'helper'

module ProgrammingProblems
  class LinkedListTest < MiniTest::Test
    describe 'LinkedList' do
      describe 'initialize' do
        it 'is empty' do
          list = LinkedList.new
          assert list.head.nil?
        end
      end

      describe 'insert' do
        it 'adds new nodes to the head of the list' do
          list = LinkedList.new
          list.insert(1)
          assert_equal 1, list.head.data
        end

        it 'links subsequent nodes to the head of the list' do
          list = LinkedList.new
          (1..2).each { |i| list.insert(i) }
          assert_equal 2, list.head.data
          assert_equal 1, list.head.next.data
        end
      end

      describe 'remove' do
        it 'deletes a node from the list' do
          list = LinkedList.new
          list.insert(1)
          assert !list.head.nil?
          list.remove(list.head)
          assert list.head.nil?
        end

        it 'reattaches the head when head is deleted' do
          list = LinkedList.new
          (1..2).each { |i| list.insert(i) }
          assert_equal 2, list.head.data
          list.remove(list.head)
          assert_equal 1, list.head.data
        end

        it 'reattaches a subsequent node when the previous node is deleted' do
          list = LinkedList.new
          (1..3).each { |i| list.insert(i) }
          assert_equal 2, list.head.next.data
          list.remove(list.head.next)
          assert_equal 1, list.head.next.data
        end
      end

      describe 'find_value' do
        it 'finds a node by value' do
          list = LinkedList.new
          (1..3).each { |i| list.insert(i) }
          assert_equal 2, list.find_value(2).data
        end

        it 'returns nil when value is not found' do
          list = LinkedList.new
          assert list.find_value(0).nil?
        end
      end

      describe 'mid' do
        it 'finds the midpoint on a list with an odd number of nodes' do
          list = LinkedList.new
          (1..5).each { |i| list.insert(i) }
          assert_equal 3, list.mid.data
        end

        it 'finds the midpoint on a list with an even number of nodes' do
          list = LinkedList.new
          (1..4).each { |i| list.insert(i) }
          assert_equal 2, list.mid.data
        end

        it 'returns the head when the list has one node' do
          list = LinkedList.new
          list.insert(1)
          assert_equal 1, list.mid.data
        end

        it 'returns nil when the list is empty' do
          list = LinkedList.new
          assert list.mid.nil?
        end
      end

      describe 'nth_from_end' do
        it 'finds the nth element from the end' do
          list = LinkedList.new
          5.downto(1).each do |n|
            list.insert(n)
          end
          5.downto(1).each_with_index do |n, i|
            assert_equal n, list.nth_from_end(i).data
          end
        end

        it 'returns head when given index is greater than the list length' do
          list = LinkedList.new
          (1..5).each { |n| list.insert(n) }
          assert_equal 5, list.nth_from_end(10).data
        end

        it 'returns nil when the list is empty' do
          list = LinkedList.new
          assert list.nth_from_end(5).nil?
        end

        it 'returns nil when given index is negative' do
          list = LinkedList.new
          (1..5).each { |n| list.insert(n) }
          assert list.nth_from_end(-5).nil?
        end
      end

      describe 'reverse!' do
        it 'reverses the nodes in the list in place' do
          list = LinkedList.new
          (1..5).each { |n| list.insert(n) }
          assert_equal [5, 4, 3, 2, 1], list.map(&:data)
          list.reverse!
          assert_equal [1, 2, 3, 4, 5], list.map(&:data)
        end

        it 'changes nothing when list is empty' do
          list = LinkedList.new
          list.reverse!
          assert_equal [], list.map(&:data)
        end

        it 'changes nothing when the list has one node' do
          list = LinkedList.new
          list.insert(1)
          list.reverse!
          assert_equal [1], list.map(&:data)
        end
      end

      describe 'equals?' do
        it 'returns true when both lists are empty' do
          list1 = LinkedList.new
          list2 = LinkedList.new
          assert list1.equals?(list2)
          assert list2.equals?(list1)
        end

        it 'returns false when one list is empty' do
          list1 = LinkedList.new
          list2 = LinkedList.new
          list1.insert(1)
          assert !list1.equals?(list2)
          assert !list2.equals?(list1)
        end

        it 'returns true when both lists have identical nodes and length' do
          list1 = LinkedList.new
          list2 = LinkedList.new
          (1..3).each do |n|
            list1.insert(n)
            list2.insert(n)
          end
          assert list1.equals?(list2)
        end

        it 'returns false when lists have same length but different values' do
          list1 = LinkedList.new
          list2 = LinkedList.new
          [1, 2].each { |n| list1.insert(n) }
          [1, 3].each { |n| list2.insert(n) }
          assert !list1.equals?(list2)
        end

        it 'returns false when lists have different lengths' do
          list1 = LinkedList.new
          list2 = LinkedList.new
          (1..2).each { |n| list1.insert(n) }
          (1..3).each { |n| list2.insert(n) }
          assert !list1.equals?(list2)
        end
      end

      describe 'merge!' do
        it 'merges another list with itself' do
          list1 = LinkedList.new
          list2 = LinkedList.new
          (4..5).each { |n| list1.insert(n) }
          (1..3).each { |n| list2.insert(n) }
          list1.merge!(list2)
          assert_equal [5, 4, 3, 2, 1], list1.map(&:data)
        end

        it 'changes nothing when both lists are empty' do
          list1 = LinkedList.new
          list2 = LinkedList.new
          list1.merge!(list2)
          assert list1.head.nil?
          assert list2.head.nil?
        end

        it 'changes nothing when given list is empty' do
          list1 = LinkedList.new
          list2 = LinkedList.new
          list1.insert(1)
          list1.merge!(list2)
          assert_equal [1], list1.map(&:data)
          assert_equal [], list2.map(&:data)
        end

        it 'merges given list when target list is empty' do
          list1 = LinkedList.new
          list2 = LinkedList.new
          list2.insert(1)
          list1.merge!(list2)
          assert_equal [1], list1.map(&:data)
        end
      end

      describe 'palindrome?' do
        it 'returns true if list is empty' do
          list = LinkedList.new
          assert list.palindrome?
        end

        it 'returns true if list has one node' do
          list = LinkedList.new
          list.insert(1)
          assert list.palindrome?
        end

        it 'returns true if list is a palindrome' do
          list = LinkedList.new
          [1, 2, 1].each { |n| list.insert(n) }
          assert list.palindrome?
        end

        it 'returns false if list is not a palindrome' do
          list = LinkedList.new
          [1, 2, 3].each { |n| list.insert(n) }
          assert !list.palindrome?
        end
      end

      describe 'looped?' do
        it 'returns false if list is empty' do
          list = LinkedList.new
          assert !list.looped?
        end

        it 'returns true if head links to itself' do
          list = LinkedList.new
          list.insert(1)
          list.head.next = list.head
          assert list.looped?
        end

        it 'returns true if a node links to a previous node' do
          list = LinkedList.new
          (1..3).each { |n| list.insert(n) }
          list.head.next.next = list.head.next
          assert list.looped?
        end

        it 'returns false if list has no loops' do
          list = LinkedList.new
          (1..3).each { |n| list.insert(n) }
          assert !list.looped?
        end
      end
    end
  end
end
