require 'programming_problems/linked_list_node'

module ProgrammingProblems
  class CircularLinkedList
    include Enumerable

    attr_accessor :head

    def each
      item = self.head
      while item
        yield item
        item = item.next
        break if item == self.head
      end
    end

    def find_value(value)
      return find { |item| item.data == value }
    end

    def insert(data)
      new_node = LinkedListNode.new(data)
      if !self.head
        new_node.next = new_node
        self.head     = new_node
      else
        new_node.next  = self.head.next
        self.head.next = new_node
        self.head.data, new_node.data = new_node.data, self.head.data
      end
    end

    def remove(target)
      if !self.head || self.head == self.head.next
        self.head = nil
        return nil
      end
      next_node   = target.next
      target.data = next_node.data
      target.next = next_node.next
      if self.head == next_node
        self.head = target
      end
    end
  end
end
