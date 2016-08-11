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

    # Reverse the items in the list in place
    def reverse!
      prev = nil
      head = self.head
      while head
        head.next, prev, head = prev, head, head.next
      end
      self.head = prev
    end

    # Compare this list with another list. Returns a boolean indicating whether
    # or not both lists contain the same data.
    def equals?(other)
      return true  if !self.head && other.head
      return false if !self.head || !other.head
      list1 = self.head
      list2 = other.head
      while list1 && list2
        return false if list1.data != list2.data
        list1 = list1.next
        list2 = list2.next
      end
      return !list1 && !list2
    end

    # Appends data from another list onto the end of the current list.
    def merge!(other)
      h1 = self.head
      h2 = other.head
      if !h1 || !h2
        self.head = h1 ? h1 : h2
        return
      end
      while h1.next
        h1 = h1.next
      end
      h1.next = h2
    end

    # Indicates whether or not the items in the list are the same both forward
    # and backward.
    def palindrome?
      stack = []
      each { |item| stack.push(item) }
      each { |item| return false if item.data != stack.pop.data }
      return true
    end

    # Indicates whether or not the list loops back on itself (i.e. the tail node
    # links back to a previous node)
    def looped?
      return false if !self.head
      leading  = self.head
      trailing = self.head
      while leading
        leading = leading.next
        return true if leading == trailing
        trailing = trailing.next
        leading  = leading.next if leading
      end
      return false
    end
  end
end
