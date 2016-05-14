module Hamming
  VERSION = 2

  def self.compute(alpha, beta, strand=DNA::Strand, machine=DNA::Machine)
    @@alpha_strand = strand.new(alpha)
    @@beta_strand = strand.new(beta)
    @@machine = machine
    run!
  end

private

  def self.run!
    return 0 if @@alpha_strand.to_s == @@beta_strand.to_s
    raise ArgumentError if @@alpha_strand.length != @@beta_strand.length
    process
  end

  def self.process
    @@machine.new(@@alpha_strand,@@beta_strand).run!
  end
end

module DNA
  class Strand
    attr_reader :string

    def initialize(string)
      @string = string
    end

    def to_s
      string
    end

    def length
      string.length
    end

    def split
      string.split('')
    end
  end
end

module DNA
  class Machine

    attr_reader :alpha, :beta

    def initialize(alpha, beta)
      @alpha = alpha
      @beta = beta
    end

    def run!
      strands = splice!(alpha), splice!(beta)
      compare(strands)
    end

    def compare(strands)
      compare = strands[0].zip(strands[1])
      compare.map do |hair|
        if hair[0] == hair[1]
          0
        else
          1
        end
      end.inject(:+)
    end

    def splice!(strand)
      strand = strand.split
    end
  end
end
