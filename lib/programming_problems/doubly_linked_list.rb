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

    # Inserts a node at the beginning of the list.
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

    # Removes a given node from the list.
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

    # Find and return the node in the list whose value is equal to the given
    # value.
    def find_value(value)
      return find { |item| item.data == value }
    end
  end
end
