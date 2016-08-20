require 'helper'

module ProgrammingProblems
  class CircularLinkedListTest < MiniTest::Test
    describe 'CircularLinkedList' do
      it 'initializes empty' do
        list = CircularLinkedList.new
        assert_equal 0, list.count
      end

      it 'is circular' do
        list = CircularLinkedList.new
        (1..2).each { |i| list.insert(i) }
        assert_equal 2, list.head.data
        assert_equal 1, list.head.next.data
        assert_equal 2, list.head.next.next.data
      end

      it 'inserts a node' do
        list = CircularLinkedList.new
        list.insert('node')
        assert_equal 1, list.count
        assert_equal 'node', list.head.data
      end

      it 'removes a node' do
        list = CircularLinkedList.new
        (1..3).each { |i| list.insert(i) }
        list.remove(list.find_value(3))
        assert_equal [2, 1], list.map(&:data)
      end

      it 'finds a node by value' do
        list = CircularLinkedList.new
        (1..3).each { |i| list.insert(i) }
        assert_equal 2, list.find_value(2).data
      end
    end
  end
end
