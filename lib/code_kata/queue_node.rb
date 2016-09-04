module CodeKata
  class QueueNode
    attr_accessor :data
    attr_accessor :next

    def initialize(data)
      @data = data
    end
  end
end
