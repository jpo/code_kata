require 'code_kata/queue_node'

module CodeKata
  # Represents a first-in, first-out collection of objects.
  class Queue
    def initialize
      @head = @tail = nil
    end

    # Pushes data to the queue.
    def push(data)
      if @tail
        @tail.next = QueueNode.new(data)
        @tail      = @tail.next
      else
        @head = @tail = QueueNode.new(data)
      end
    end

    # Retrieves data from the queue. If the queue is empty, RuntimeError is
    # raised.
    def pop
      raise 'No items to pop' unless @head
      result = @head.data
      @head  = @head.next
      @tail  = nil unless @head
      result
    end

    # Returns true if the queue is empty.
    def empty?
      @head.nil?
    end
  end
end
