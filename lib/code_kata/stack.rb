require 'code_kata/linked_list'

module CodeKata
  class Stack
    def initialize
      @list = LinkedList.new
    end

    def push(data)
      @list.insert(data)
    end

    def pop
      raise 'No items in stack' unless @list.head
      result     = @list.head.data
      @list.head = @list.head.next
      result
    end

    def empty?
      @list.head.nil?
    end
  end
end
