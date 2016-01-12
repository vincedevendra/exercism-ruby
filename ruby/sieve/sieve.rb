class Sieve
  def initialize(upper_limit)
    @upper_limit = upper_limit
  end

  def primes
    prime_nums = (2..@upper_limit).to_a

    prime_nums.each do |num|
      i = num
      prime_nums.delete(i += num) until i > @upper_limit
    end
  end
end
