class Sieve
  attr_reader :iterator, :ceiling, :group, :basket, :baskets

  FIRST_PRIME = 2

  def initialize(ceiling, basket=NumberBasket)
    @iterator = FIRST_PRIME
    @ceiling  = ceiling
    @basket   = basket
    @baskets  = []
    return [] if ceiling < FIRST_PRIME
    fill_baskets
  end

  def primes
    get_primes
  end

private

  def fill_baskets
    baskets << basket.new(iterator, ceiling)
    ceiling.times do
      while iterator < ceiling do
        @iterator += 1 # not sure why scope won't let me remove @
        filter_baskets
      end
    end
  end

  def filter_baskets
    check = baskets.map do |basket|
      basket.contain_composite?(iterator)
    end

    unless check.include?(true)
      baskets << basket.new(iterator, ceiling)
    end
  end

  def get_primes
    baskets.map do |group|
      group.prime
    end
  end
end

class NumberBasket
  attr_reader :prime, :ceiling, :basket, :prime

  def initialize(prime, ceiling)
    @prime   = prime
    @ceiling = ceiling
    @basket  = [ prime ]
    add_composites
  end

  def add_composites
    number = prime
    until number > (ceiling - prime)
      basket << number += prime
    end
  end

  def contain_composite?(prime)
    basket.include?(prime)
  end
end
