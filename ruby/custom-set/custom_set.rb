class CustomSet
  attr_reader :items

  def initialize(input = [])
    @input = input
    @items = input.to_a.uniq
  end

  def ==(other)
    items.sort == other.items.sort
  end

  def delete(item)
    @items -= [item]
    self
  end

  def difference(other)
    @items -= other.items
    self
  end

  def disjoint?(other)
    return true if items.empty? && other.items.empty?
    (items - other.items).size == items.size
  end

  def empty
    @items = []
    self
  end

  def intersection(other)
    @items = items.select { |item| includes?(other.items, item) }
    self
  end

  def member?(item)
    includes?(items, item)
  end

  def put(item)
    @items << item unless member?(item)
    self
  end

  def size
    items.size
  end

  def subset?(other)
    other.items.all? { |item| includes?(items, item) }
  end

  def to_a
    items
  end

  def union(other)
    other.items.each { |item| @items << item }
    self
  end

  def includes?(items, item)
    (items - [item]).size < items.size
  end
end
