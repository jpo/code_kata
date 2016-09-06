require 'code_kata/queue_node'

module CodeKata
  class Queue
    def initialize
      @head = @tail = nil
    end

    def push(data)
      if @tail
        @tail.next = QueueNode.new(data)
        @tail      = @tail.next
      else
        @head = @tail = QueueNode.new(data)
      end
    end

    def pop
      raise 'No items to pop' unless @head
      result = @head.data
      @head  = @head.next
      @tail  = nil unless @head
      result
    end

    def empty?
      @head.nil?
    end
  end
end
