require 'code_kata/linked_list_node'

module CodeKata
  class CircularLinkedList
    include Enumerable

    attr_accessor :head

    def each
      node = head
      while node
        yield node
        node = node.next
        break if node == head
      end
    end

    # Inserts a node at the beginning of the list.
    def insert(data)
      new_node = LinkedListNode.new(data)
      if !head
        new_node.next = new_node
        self.head     = new_node
      else
        new_node.next = head.next
        head.next = new_node
        head.data, new_node.data = new_node.data, head.data
      end
    end

    # Removes a given node from the list.
    def remove(target)
      if !head || head == head.next
        self.head = nil
        return nil
      end
      next_node   = target.next
      target.data = next_node.data
      target.next = next_node.next
      self.head   = target if head == next_node
    end

    # Find and return the node in the list whose value is equal to the given
    # value.
    def find_value(value)
      find { |node| node.data == value }
    end
  end
end
