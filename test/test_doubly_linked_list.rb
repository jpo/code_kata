require 'helper'

module ProgrammingProblems
  class DoublyLinkedListTest < MiniTest::Test
    describe 'DoublyLinkedList' do
      it 'initializes empty' do
        list = DoublyLinkedList.new
        assert_equal 0, list.count
      end

      it 'is circular' do
        list = DoublyLinkedList.new
        list.insert('foo')
        list.insert('bar')
        assert_equal 'bar', list.head.data
        assert_equal 'foo', list.head.next.data
        assert_equal 'bar', list.head.next.next.data
      end

      it 'is doubly linked' do
        list = DoublyLinkedList.new
        list.insert('foo')
        list.insert('bar')
        list.insert('baz')
        assert_equal 'baz', list.head.data
        assert_equal 'bar', list.head.next.data
        assert_equal 'foo', list.head.prev.data
      end

      it 'inserts a node' do
        list = DoublyLinkedList.new
        list.insert('node')
        assert_equal 1, list.count
        assert_equal 'node', list.head.data
      end

      it 'finds a node by value' do
        list = DoublyLinkedList.new
        list.insert('foo')
        list.insert('bar')
        result = list.find_value('foo')
        assert_equal 'foo', result.data
      end

      it 'removes a node' do
        list = DoublyLinkedList.new
        list.insert('foo')
        list.insert('bar')
        list.remove(list.head)
        assert_equal 1, list.count
      end

      it 'links a single node to itself' do
        list = DoublyLinkedList.new
        list.insert('foo')
        assert_equal list.head, list.head.next
      end

      it 'has a tail that references the head' do
        list = DoublyLinkedList.new
        list.insert('foo')
        list.insert('bar')
        assert_equal 'bar', list.head.data
        assert_equal 'foo', list.head.next.data
        assert_equal 'bar', list.head.next.next.data
      end

      it 'keeps references after removing a node' do
        list = DoublyLinkedList.new
        list.insert('foo')
        list.insert('bar')
        list.insert('baz')
        list.remove(list.head.next)
        assert_equal 2, list.count
        assert_equal 'baz', list.head.data
        assert_equal 'foo', list.head.next.data
        assert_equal 'baz', list.head.next.next.data
      end
    end
  end
end
