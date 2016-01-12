class ETL
  def self.transform(old)
    old.each_with_object({}) do |e, a|
      e[1].each { |letter| a[letter.downcase] = e[0] }
    end
  end
end
