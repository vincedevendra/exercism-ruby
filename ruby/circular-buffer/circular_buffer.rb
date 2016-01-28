class CircularBuffer
  def initialize(size)
    @size = size
    @buffer = []
  end

  def read
    buffer.first ? buffer.delete_at(0) : raise(BufferEmptyException)
  end

  def write(element)
    update_buffer(element) { raise BufferFullException }
  end

  def write!(element)
    update_buffer(element) { buffer.shift }
  end

  def clear
    @buffer = []
  end

  private

  attr_reader :size, :buffer

  def update_buffer(element)
    return if element.nil?
    yield if buffer.size == size
    buffer << element
  end

  class BufferEmptyException < Exception; end
  class BufferFullException < Exception; end
end
