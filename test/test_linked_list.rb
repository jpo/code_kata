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
      end

      describe 'mid' do
        it 'finds the midpoint' do
          list = LinkedList.new
          (1..5).each { |i| list.insert(i) }
          assert_equal 3, list.mid.data
        end
      end

      describe 'nth_from_end' do
        it 'finds the nth element from the end' do
          list = LinkedList.new
          5.downto(1).each do |n|
            list.insert(n)
          end
          5.downto(1).each_with_index do |n,i|
            assert_equal n, list.nth_from_end(i).data
          end
        end
      end

      describe 'reverse!' do
        it 'reverses the items in the list' do
          list = LinkedList.new
          (1..5).each { |n| list.insert(n) }
          assert_equal [5,4,3,2,1], list.map(&:data)
          list.reverse!
          assert_equal [1,2,3,4,5], list.map(&:data)
        end
      end

      describe 'equals?' do
        it 'compares another list with itself' do
          list1 = LinkedList.new
          list2 = LinkedList.new
          list3 = LinkedList.new
          (1..5).each do |n|
            list1.insert(n)
            list2.insert(n)
          end
          assert list1.equals?(list2)
          assert !list1.equals?(list3)
        end
      end

      describe 'merge!' do
        it 'merges another list with itself' do
          list1 = LinkedList.new
          (4..5).each { |n| list1.insert(n) }
          list2 = LinkedList.new
          (1..3).each { |n| list2.insert(n) }
          list1.merge!(list2)
          assert_equal [5,4,3,2,1], list1.map(&:data)
        end
      end

      describe 'palindrome?' do
        it 'determines if the list is a palindrome' do
          list1 = LinkedList.new
          [1,2,1].each { |n| list1.insert(n) }
          list2 = LinkedList.new
          [1,2,3].each { |n| list2.insert(n) }
          assert list1.palindrome?
          assert !list2.palindrome?
        end
      end

      describe 'looped?' do
        it 'detects loops' do
          list = LinkedList.new
          (1..3).each { |n| list.insert(n) }
          assert !list.looped?
          list.head.next.next.next = list.head.next
          assert list.looped?
        end
      end
    end
  end
end
