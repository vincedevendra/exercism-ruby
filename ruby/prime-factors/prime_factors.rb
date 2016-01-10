class PrimeFactors
  #require 'prime'
  
  # def self.for(number)
  #   Prime.prime_division(number).each_with_object([]) do |e, a|
  #     e[1].times { a << e[0] }
  #   end
  # end

  def self.for(number)
    primes.each_with_object([]) do |prime, a|
      return a if prime > number
      number1, mod = number.divmod(prime)
      next unless mod == 0
      number = number1
      a << prime
      redo
    end
  end

  #A very inefficient prime number generator
  def self.primes
    Enumerator.new do |y|
      upper_limit = 2
      prime_nums = [2]
      length = 1

      loop do
        prime_nums.each do |num|
          i = num
          prime_nums.delete(i += num) while i < upper_limit
        end

        if prime_nums.last == 2 || prime_nums.length > length
          y << prime_nums.last 
        end

        length = prime_nums.length
        prime_nums << upper_limit += 1
      end
    end
  end
end

