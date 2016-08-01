require 'programming_problems/linked_list_node'

module ProgrammingProblems
  class LinkedList
    include Enumerable

    attr_accessor :head

    def each
      item = head
      while item
        yield item
        item = item.next
      end
    end

    def find_value(value)
      find { |item| item.data == value }
    end

    def insert(data)
      @head = LinkedListNode.new(data, head)
    end

    def insert_sorted(data)
      if !head || data <= head.data
        return insert(data)
      end

      current = head

      while current.next && current.next.data < data
        current = current.next
      end

      current.next = LinkedListNode.new(data, current.next)
    end

    def remove(target)
      @head = head.next if head == target
      prev  = find { |item| item.next == target }
      prev.next = prev.next.next if prev
    end
  end
end
