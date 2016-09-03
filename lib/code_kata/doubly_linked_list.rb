require 'code_kata/doubly_linked_list_node'

module CodeKata
  class DoublyLinkedList
    include Enumerable

    attr_accessor :head

    def each
      item = head
      while item
        yield item
        item = item.next
        break if item == head
      end
    end

    # Inserts a node at the beginning of the list.
    def insert(data)
      unless head
        self.head = DoublyLinkedListNode.new(data)
        head.prev = head.next = head
        return
      end
      node = DoublyLinkedListNode.new(data, head.prev, head)
      head.prev.next = node
      head.prev = node
      self.head = node
    end

    # Removes a given node from the list.
    def remove(target)
      if head == head.next
        self.head = nil
        return
      else
        target.prev.next = target.next
        target.next.prev = target.prev
        self.head = head.next if head == target
      end
    end

    # Find and return the node in the list whose value is equal to the given
    # value.
    def find_value(value)
      find { |item| item.data == value }
    end

    # Reverse the items in the list in place
    def reverse!
      return unless head
      return if head.next == head
      tail = head
      loop do
        tail.next, tail.prev, tail = tail.prev, tail.next, tail.next
        break unless tail != head
      end
      self.head = head.next
    end

    # Indicates whether or not the items in the list are the same both forward
    # and backward.
    def palindrome?
      return true if !head || head == self.next
      head = self.head
      tail = self.head.prev
      loop do
        return false if head.data != tail.data
        head = head.next
        tail = tail.next
        break unless head != tail && head != tail.next
      end
      true
    end
  end
end
