require 'helper'

module ProgrammingProblems
  class DoublyLinkedListTest < MiniTest::Test
    describe 'DoublyLinkedList' do
      it 'initializes empty' do
        list = DoublyLinkedList.new
        assert_equal 0, list.count
      end

      it 'is doubly linked' do
        list = DoublyLinkedList.new
        (1..3).each { |i| list.insert(i) }
        assert_equal 3, list.head.data
        assert_equal 2, list.head.next.data
        assert_equal 1, list.head.prev.data
      end

      it 'is circular' do
        list = DoublyLinkedList.new
        (1..2).each { |i| list.insert(i) }
        assert_equal 2, list.head.data
        assert_equal 1, list.head.next.data
        assert_equal 2, list.head.next.next.data
      end

      it 'inserts a node' do
        list = DoublyLinkedList.new
        list.insert(1)
        assert_equal 1, list.count
        assert_equal 1, list.head.data
      end

      it 'removes a node' do
        list = DoublyLinkedList.new
        (1..3).each { |i| list.insert(i) }
        list.remove(list.find_value(3))
        assert_equal [2,1], list.map { |item| item.data }
      end

      it 'finds a node by value' do
        list = DoublyLinkedList.new
        (1..3).each { |i| list.insert(i) }
        assert_equal 2, list.find_value(2).data
      end
    end
  end
end
