
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

      describe '[]=' do
        it 'inserts an item in the heap at the given index' do
          heap = Heap.new([])
          heap[0] = 1
          assert_equal 1, heap.size
          assert_equal 1, heap[0]
        end

        it 'inserts nil items when the index is greater than the heap size' do
          heap = Heap.new([])
          heap[2] = 1
          assert_equal 3, heap.size
          [nil, nil, 1].each_with_index do |n, i|
            assert_equal n, heap[i]
          end
        end

        it 'updates an item in the heap at the given index' do
          heap = Heap.new([4])
          heap[0] = 1
          assert_equal 1, heap.size
          assert_equal 1, heap[0]
        end
      end

      describe 'insert' do
        it 'inserts an item into an empty heap' do
          heap = Heap.new([])
          heap.insert(1)
          assert_equal 1, heap.size
        end

        it 'inserts an item into an non-empty heap' do
          heap = Heap.new([1,2,3])
          heap.insert(4)
          assert_equal 4, heap.size
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

      describe 'find_first' do
        it 'finds the max item in the heap' do
          heap = Heap.new([1, 4, 9, 7])
          assert_equal 9, heap.find_first
        end

        it 'is nil when the heap is empty' do
          heap = Heap.new([])
          assert heap.find_first.nil?
        end
      end

      describe 'remove_first' do
        it 'removes the max item in the heap' do
          heap = Heap.new([1, 4, 9, 7])
          heap.remove_first
          assert_equal 3, heap.size
        end
      end
    end
  end
end