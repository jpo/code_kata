require 'code_kata/linked_list'

module CodeKata
  # Represents a last-in, first-out collection of objects.
  class Stack
    def initialize
      @list = LinkedList.new
    end

    # Pushes data to the top of the stack.
    def push(data)
      @list.insert(data)
    end

    # Retrieves data from the top of the stack. If the stack is empty,
    # RuntimeError is raised.
    def pop
      raise 'No items in stack' unless @list.head
      result     = @list.head.data
      @list.head = @list.head.next
      result
    end

    # Retrieves data from the top of the stack without removing it.
    def peek
      raise 'No items in stack' unless @list.head
      @list.head.data
    end

    # Returns true if the stack is empty.
    def empty?
      @list.head.nil?
    end
  end
end
