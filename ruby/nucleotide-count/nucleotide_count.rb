class Nucleotide
  NUCLEOTIDES = %w(A T C G)

  def initialize(strand)
    @strand = strand
  end

  def self.from_dna(strand)
     raise ArgumentError unless (strand.chars - NUCLEOTIDES).empty?
     new(strand)
  end

  def count(nucleotide)
    @strand.chars.count { |char| char == nucleotide }
  end

  def histogram
    NUCLEOTIDES.each_with_object({}) do |nucleotide, result|
      result[nucleotide] = count(nucleotide)
    end
  end
end

