require 'programming_problems/linked_list_node'

module ProgrammingProblems
  class LinkedList
    include Enumerable

    attr_accessor :head

    def each
      item = self.head
      while item
        yield item
        item = item.next
      end
    end

    # Inserts a node at the beginning of the list.
    def insert(data)
      self.head = LinkedListNode.new(data, self.head)
    end

    # Removes a given node from the list.
    def remove(target)
      self.head = self.head.next if self.head == target
      prev  = find { |item| item.next == target }
      prev.next = prev.next.next if prev
    end

    # Find and return the node in the list whose value is equal to the given
    # value.
    def find_value(value)
      find { |item| item.data == value }
    end

    # Find the midpoint in the list using a single scan.
    def mid
      index    = self.head
      trailing = self.head
      while index
        index = index.next
        if index
          index    = index.next
          trailing = trailing.next
        end
      end
      return trailing
    end

    # Finds the node at position n from the end of the list.
    def nth_from_end(n)
      index    = self.head
      trailing = self.head
      n.times do
        index = index.next if index
      end
      while index && index.next
        index    = index.next
        trailing = trailing.next
      end
      return trailing
    end

    # Reverse the items in the list
    def reverse
      prev = nil
      head = self.head
      while head
        head.next, prev, head = prev, head, head.next
      end
      self.head = prev
    end
  end
end
