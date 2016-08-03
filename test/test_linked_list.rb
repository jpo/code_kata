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
    end
  end
end