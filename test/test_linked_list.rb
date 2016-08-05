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
        list.insert('node')
        assert_equal 1, list.count
        assert_equal 'node', list.head.data
      end

      it 'finds a node by value' do
        list = LinkedList.new
        list.insert('foo')
        list.insert('bar')
        result = list.find_value('foo')
        assert_equal 'foo', result.data
      end

      it 'removes a node' do
        list = LinkedList.new
        list.insert('foo')
        assert_equal 1, list.count
        target = list.find_value('foo')
        list.remove(target)
        assert_equal 0, list.count
      end

      it 'finds the midpoint' do
        list = LinkedList.new
        list.insert(5)
        list.insert(4)
        list.insert(3)
        list.insert(2)
        list.insert(1)
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
    end
  end
end
