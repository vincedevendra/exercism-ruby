class PrimeFactors
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

  private

  def self.primes
    Enumerator.new do |y|
      y << 2
      i = 3
      loop do
        y << i if prime?(i)
        i += 2
      end
    end
  end

  def self.prime?(num)
    !(2.upto(Math.sqrt(num)).any? { |i| num % i == 0 })
  end
end
