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

    def insert(value)
      @array << value
      index  = @array.size - 1
      parent = parent_index(index)
      while index.nonzero? && compare(index, parent)
        @array[index], @array[parent] = @array[parent], @array[index]
        index  = parent
        parent = parent_index(index)
      end
    end

    def size
      @array.size
    end

    def find_first
      @array[0]
    end

    def remove_first
      @array[0] = @array[-1]
      @array.pop
      index = 0
      while index < @array.size
        child = lchild_index(index)
        break if child >= @array.size
        right = rchild_index(index)
        child = right if right < @array.size && compare(right, child)
        break if compare(index, child)
        @array[index], @array[child] = @array[child], @array[index]
        index = child
      end
    end

    def increase_key(index)
      @array[index] += 1
      parent = parent_index(index)
      until index.zero? || compare(parent, index)
        @array[index], @array[parent] = @array[parent], @array[index]
        index  = parent_index(index)
        parent = parent_index(index)
      end
    end

    def enumerate_powers(set, num_powers)
      out   = []
      array = []
      value = 0
      set.each { |i| array << [1, i] }
      heap = Heap.new(array, proc { |lhs, rhs|
        next lhs[0] < rhs[0] || (!(lhs[0] > rhs[0]) && lhs[1] < rhs[1])
      })
      until num_powers.zero? || heap.size.zero?
        entry = heap.find_first
        heap.remove_first
        until value == entry[0] 
          value = entry[0]
          out << value
          num_powers -= 1
        end
        heap.insert([entry[0] * entry[1], entry[1]])
      end
      out
    end

    def find_top_k(stream, k)
      heap = Heap.new([], proc { |lhs, rhs| next lhs < rhs })
      stream.each do |value|
        if heap.size < k
          heap.insert(value)
        elsif value > heap.find_first
          heap.remove_first
          heap.insert(value)
        end
      end
      heap.array
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
