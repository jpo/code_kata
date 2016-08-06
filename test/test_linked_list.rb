require 'helper'

module ProgrammingProblems
  class LinkedListTest < MiniTest::Test
    describe 'LinkedList' do
      it 'initializes empty' do
        list = LinkedList.new
        assert_equal 0, list.count
      end

      it 'inserts a node' do
        list = LinkedList.new
        list.insert(1)
        assert_equal 1, list.count
        assert_equal 1, list.head.data
      end

      it 'removes a node' do
        list = LinkedList.new
        (1..3).each { |i| list.insert(i) }
        list.remove(list.find_value(3))
        assert_equal [2,1], list.map(&:data)
      end

      it 'finds a node by value' do
        list = LinkedList.new
        (1..3).each { |i| list.insert(i) }
        assert_equal 2, list.find_value(2).data
      end

      it 'finds the midpoint' do
        list = LinkedList.new
        1.upto(5).each { |n| list.insert(n) }
        assert_equal 3, list.mid.data
      end

      it 'finds the nth element from the end' do
        list = LinkedList.new
        5.downto(1).each do |n|
          list.insert(n)
        end
        5.downto(1).each_with_index do |n,i|
          assert_equal n, list.nth_from_end(i).data
        end
      end

      it 'reverses the items in the list' do
        list = LinkedList.new
        (1..5).each { |n| list.insert(n) }
        assert_equal [5,4,3,2,1], list.map(&:data)
        list.reverse!
        assert_equal [1,2,3,4,5], list.map(&:data)
      end
    end
  end
end
