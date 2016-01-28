class SecretHandshake
  SUPER_SECRET_DECODER = { 1 => "wink", 10 => "double blink",
                          100 => "close your eyes", 1000 => "jump" }

  def initialize(integer)
    @integer = integer
  end

  def binary(num)
    num.to_s(2).to_i
  end

  def commands
    binary = binary(@integer)
    SUPER_SECRET_DECODER.to_a.reverse.to_h.each_with_object([]) do |(k, v), result|
      require 'pry'; binding.pry
      next unless binary.to_s.start_with?(k.to_s)
      result << v
      binary -= k
    end
  end
end
