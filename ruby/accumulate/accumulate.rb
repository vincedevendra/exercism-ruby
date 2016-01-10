class Array
  def accumulate
    reduce([]) { |a, e| a << yield(e) }
  end
end
