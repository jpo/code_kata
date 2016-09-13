
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