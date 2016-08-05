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

    def find_value(value)
      find { |item| item.data == value }
    end

    def insert(data)
      self.head = LinkedListNode.new(data, self.head)
    end

    def insert_sorted(data)
      if !self.head || data <= self.head.data
        return insert(data)
      end

      current = self.head

      while current.next && current.next.data < data
        current = current.next
      end

      current.next = LinkedListNode.new(data, current.next)
    end

    def remove(target)
      self.head = self.head.next if self.head == target
      prev  = find { |item| item.next == target }
      prev.next = prev.next.next if prev
    end

    # Find the midpoint in the list using a single scan.
    #
    # == Note
    #
    # This method works by moving two indices: index and trailing. As the list
    # is scanned, 'index' is moved twice per iteration and 'trailing' is moved
    # once per iteration. The result is that when 'index' reaches the end of
    # the list, 'trailing' should be at the midpoint.
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

    # Finds the node at position n from the end of the list
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
  end
end
