module CodeKata
  class BinaryTreeNode
    attr_accessor :data, :left, :right

    def initialize(data)
      @data  = data
      @left  = nil
      @right = nil
    end
  end
end
