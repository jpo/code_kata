require 'helper'

module CodeKata
  class QueueTest < MiniTest::Test
    describe 'Queue' do
      describe 'initialize' do
        it 'initializes empty' do
          queue = Queue.new
          assert queue.empty?
        end
      end

      describe 'push' do
        it 'adds a node to the queue' do
          queue = Queue.new
          queue.push(1)
          assert_equal 1, queue.pop
        end
      end

      describe 'pop' do
        it 'raises a RuntimeError when the queue is empty' do
          queue = Queue.new
          assert_raises(RuntimeError) { queue.pop } 
        end

        it 'returns the oldest node in the queue' do
          queue = Queue.new
          1.upto(3) { |n| queue.push(n) }
          assert_equal 1, queue.pop
        end

        it 'removes the oldest node in the queue' do
          queue = Queue.new
          1.upto(3) { |n| queue.push(n) }
          1.upto(3) { |n| assert_equal n, queue.pop }
        end
      end

      describe 'empty' do
        it 'is empty when the queue has no nodes' do
          queue = Queue.new
          assert queue.empty?
        end

        it 'is not empty when the queue has nodes' do
          queue = Queue.new
          queue.push(1)
          assert !queue.empty?
        end
      end
    end
  end
end