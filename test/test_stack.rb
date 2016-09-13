
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
    end
  end
end