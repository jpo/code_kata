require 'programming_problems/linked_list_node'

module ProgrammingProblems
  class LinkedList
    include Enumerable

    attr_accessor :head

    def each
      node = head
      while node
        yield node
        node = node.next
      end
    end

    # Inserts a node at the beginning of the list.
    def insert(data)
      self.head = LinkedListNode.new(data, head)
    end

    # Removes a given node from the list.
    def remove(target)
      self.head = head.next if head == target
      prev = find { |node| node.next == target }
      prev.next = prev.next.next if prev
    end

    # Find and return the node in the list whose value is equal to the given
    # value.
    def find_value(value)
      find { |node| node.data == value }
    end

    # Find the midpoint in the list using a single scan.
    def mid
      index    = head
      trailing = head
      while index
        index = index.next
        if index
          index    = index.next
          trailing = trailing.next
        end
      end
      trailing
    end

    # Finds the node at position n from the end of the list.
    def nth_from_end(n)
      return if n < 0
      index    = head
      trailing = head
      n.times do
        index = index.next if index
      end
      while index && index.next
        index    = index.next
        trailing = trailing.next
      end
      trailing
    end

    # Reverse the nodes in the list in place
    def reverse!
      prev = nil
      head = self.head
      head.next, prev, head = prev, head, head.next while head
      self.head = prev
    end

    # Compare this list with another list. Returns a boolean indicating whether
    # or not both lists contain the same data.
    def equals?(other)
      return true  if !head && !other.head
      return false if !head || !other.head
      list1 = head
      list2 = other.head
      while list1 && list2
        return false if list1.data != list2.data
        list1 = list1.next
        list2 = list2.next
      end
      !list1 && !list2
    end

    # Appends data from another list onto the end of the current list.
    def merge!(other)
      h1 = head
      h2 = other.head
      if !h1 || !h2
        self.head = h1 ? h1 : h2
        return
      end
      h1 = h1.next while h1.next
      h1.next = h2
    end

    # Indicates whether or not the nodes in the list are the same both forward
    # and backward.
    def palindrome?
      stack = []
      each { |node| stack.push(node) }
      each { |node| return false if node.data != stack.pop.data }
      true
    end

    # Indicates whether or not the list loops back on itself (i.e. the tail node
    # links back to a previous node)
    def looped?
      return false unless head
      leading  = head
      trailing = head
      while leading
        leading = leading.next
        return true if leading == trailing
        trailing = trailing.next
        leading  = leading.next if leading
      end
      false
    end
  end
end
