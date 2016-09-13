require 'code_kata/linked_list'

module CodeKata
  class Stack
    def initialize
      @list = LinkedList.new
    end

    def push(data)
      @list.insert(data)
    end

    def empty?
      @list.head.nil?
    end
  end
end
