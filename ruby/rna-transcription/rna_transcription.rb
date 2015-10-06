class Complement
  VERSION = 2

  COMPLEMENTS = {'G' => 'C', 'C' => 'G', 'T' => 'A', 'A' => 'U'}

  def self.of_dna(sequence)
    dna_nucleotides = COMPLEMENTS.keys

    unless valid?(sequence, dna_nucleotides)
      raise ArgumentError, "DNA only includes #{dna_nucleotides.join(', ')}"
    else
      sequence.chars.map { |nucleotide| COMPLEMENTS[nucleotide] }.join
    end
  end

  def self.of_rna(sequence)
    rna_nucleotides = COMPLEMENTS.values

    unless valid?(sequence, rna_nucleotides)
      raise ArgumentError, "RNA only includes #{rna_nucleotides.join(', ')}"
    else
      sequence.chars.map { |nucleotide| COMPLEMENTS.invert[nucleotide] }.join
    end
  end

  private

  def self.valid?(sequence, nucleotides)
    sequence.chars.all? { |nucleotide| nucleotides.include?(nucleotide) }
  end
end
