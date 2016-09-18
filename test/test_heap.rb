
require 'helper'

module CodeKata
  class HeapTest < MiniTest::Test
    describe 'Heap' do
      describe 'initialize' do
        it 'initializes empty' do
          heap = Heap.new([])
          assert_equal 0, heap.size
        end

        it 'initializes with an array of items' do
          heap = Heap.new([1, 2, 3])
          assert_equal 3, heap.size
        end
      end

      describe '[]' do
        it 'retrieves an item from the heap at a given index' do
          heap = Heap.new([3, 1, 2])
          [3, 1, 2].each_with_index do |n, i|
            assert_equal n, heap[i]
          end
        end

        it 'is nil when an item with the given index does not exist' do
          heap = Heap.new([])
          assert heap[3].nil?
        end
      end

      describe 'size' do
        it 'is zero when the heap is empty' do
          heap = Heap.new([])
          assert_equal 0, heap.size
        end

        it 'is equal to number of items in the heap' do
          heap = Heap.new([1, 2, 3])
          assert_equal 3, heap.size
        end
      end
    end
  end
end