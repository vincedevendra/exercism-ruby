class Bst
  attr_reader :data, :left, :right

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end

  def insert(new_data)
    new_node = Bst.new(new_data)

    if new_data > data
      if @right
        @right.insert(new_data)
      else
        @right = new_node
      end
    else
      if @left
        @left.insert(new_data)
      else
        @left = new_node
      end
    end
  end

  def each
    node = self
    loop do
      if node&.left
        node = node.left
      else
        break
      end
    end

    yield(node.data)

    loop do
      if node&.right
        node = node.right
        yield(node.data)
      else
        break
      end
    end
  end
end
