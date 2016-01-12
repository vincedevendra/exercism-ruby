class PrimeFactors
  #require 'prime'
  
  # def self.for(number)
  #   Prime.prime_division(number).each_with_object([]) do |e, a|
  #     e[1].times { a << e[0] }
  #   end
  # end

  def self.for(number)
    Prime.primes.each_with_object([]) do |prime, a|
      return a if prime > number
      number1, mod = number.divmod(prime)
      next unless mod == 0
      number = number1
      a << prime
      redo
    end
  end
end

class Prime
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

  private

  def self.prime?(num)
    2.upto(Math.sqrt(num)).each { |i| return false if num % i == 0 }
    true
  end
end

