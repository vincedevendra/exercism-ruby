module KeepReject
  def keep
    self.each_with_object([]) { |e, a| a << e if yield(e) }
  end

  def discard
    self.each_with_object([]) { |e, a| a << e unless yield(e) }
  end
end

class Array
  include KeepReject
end
