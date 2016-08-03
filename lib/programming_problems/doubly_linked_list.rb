require 'programming_problems/doubly_linked_list_node'

module ProgrammingProblems
  class DoublyLinkedList
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
      if !self.head
        self.head = DoublyLinkedListNode.new(data)
        self.head.prev = self.head.next = self.head
        return
      end
      node = DoublyLinkedListNode.new(data, self.head.prev, self.head)
      self.head.prev.next = node
      self.head.prev = node
      self.head = node
    end

    def remove(target)
      if self.head == self.head.next
        self.head = nil
        return
      else
        target.prev.next = target.next
        target.next.prev = target.prev
        self.head = self.head.next if self.head == target
      end
    end
  end
end
