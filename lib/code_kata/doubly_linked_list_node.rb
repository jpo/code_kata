module CodeKata
  class DoublyLinkedListNode
    attr_accessor :data
    attr_accessor :prev
    attr_accessor :next

    def initialize(data, prev_node = nil, next_node = nil)
      @data = data
      @prev = prev_node
      @next = next_node
    end
  end
end
