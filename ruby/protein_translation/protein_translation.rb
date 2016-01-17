class Translation
  TRANSLATOR = { %w(UUU UUC) => 'Phenylalanine', %w(UUA UUG) => 'Leucine',
                 %w(UCU UCC UCA UCG) => 'Serine', %w(AUG) => 'Methionine',
                 %w(UAU UAC) => 'Tyrosine', %w(UGU UGC) => 'Cysteine',
                 %w(UGG) => 'Tryptophan', %w(UAA UAG UGA) => 'STOP' }

  def self.of_codon(codon)
    TRANSLATOR.each { |k, v| return v if k.include?(codon) }
    fail ArgumentError
  end

  def self.of_rna(strand)
    strand.scan(/.{3}/).each_with_object([]) do |codon, result|
      protein = of_codon(codon)
      return result if protein == 'STOP'
      result << protein
    end
  end
end
