class Hamming
  VERSION = 1

  def self.compute(strand1, strand2)
    unless strand1.length == strand2.length
      raise ArgumentError, "Strands must be of equal length."
    end

    strand1.chars.zip(strand2.chars).select{ |array| array[0] != array[1] }.size
  end
end
