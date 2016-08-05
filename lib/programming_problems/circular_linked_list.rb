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

    # Inserts a node at the beginning of the list.
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

    # Removes a given node from the list.
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

    # Find and return the node in the list whose value is equal to the given
    # value.
    def find_value(value)
      return find { |item| item.data == value }
    end
  end
end
