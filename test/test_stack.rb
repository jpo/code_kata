
require 'helper'

module CodeKata
  class StackTest < MiniTest::Test
    describe 'Stack' do
      describe 'initialize' do
        it 'initializes empty' do
          stack = Stack.new
          assert stack.empty?
        end
      end

      describe 'push' do
        it 'pushs a node onto the stack' do
          stack = Stack.new
          stack.push(1)
          assert !stack.empty?
        end
      end

      describe 'pop' do
        it 'raises a RuntimeError when the stack is empty' do
          stack = Stack.new
          assert_raises(RuntimeError) { stack.pop } 
        end

        it 'removes the last node pushed onto the stack' do
          stack = Stack.new
          1.upto(3)   { |n| stack.push(n) }
          3.downto(1) { |n| assert_equal n, stack.pop }
        end

        it 'returns the last node pushed onto the stack' do
          stack = Stack.new
          1.upto(3) { |n| stack.push(n) }
          assert_equal 3, stack.pop
        end
      end

      describe 'empty?' do
        it 'is empty when the stack has no nodes' do
          stack = Stack.new
          assert stack.empty?
        end

        it 'is not empty when the stack has nodes' do
          stack = Stack.new
          stack.push(1)
          assert !stack.empty?
        end
      end
    end
  end
end