module ProgrammingProblems
  class LinkedListNode
    attr_accessor :data
    attr_accessor :next

    def initialize(data, next_node = nil)
      @data = data
      @next = next_node
    end
  end
end
