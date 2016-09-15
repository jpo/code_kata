module CodeKata
  class Heap
    attr_accessor :array

    def initialize(array, compare = nil)
      @compare = compare
      @array   = array
      @array.each_index do |index|
        parent = parent_index(index)
        until index == parent || compare(parent, index)
          @array[parent], @array[index] = @array[index], @array[parent]
          index  = parent
          parent = parent_index(index)
        end
      end
    end

    def [](index)
      @array[index]
    end

    def []=(index, value)
      @array[index] = value
    end

    def size
      @array.size
    end

    private

    def compare(lhs, rhs)
      return @array[lhs] >= @array[rhs] unless @compare
      @compare.call(@array[lhs], @array[rhs])
    end

    def parent_index(index)
      index.nonzero? ? (index - 1) / 2 : 0
    end

    def lchild_index(index)
      index * 2 + 1
    end

    def rchild_index(index)
      index * 2 + 2
    end
  end
end
