
require 'helper'

module CodeKata
  class HeapTest < MiniTest::Test
    describe 'Heap' do
      describe 'initialize' do
        it 'initializes empty' do
          heap = Heap.new([])
          assert_equal 0, heap.size
        end
      end
    end
  end
end