module Complement
  VERSION = 3
  def self.of_dna(fixture, complementer=Tool::Complementer)
    complementer.new(fixture).compare
  end
end

module Tool
  class Complementer

    COMPLEMENT = {
      'G' => 'C',
      'C' => 'G',
      'T' => 'A',
      'A' => 'U'
    }

    attr_reader :nuc, :splice

    def initialize(nucleotide)
      @nuc = nucleotide
      check_for_typos
    end

    def splice
      @splice = nuc.split('')
    end

    def compare
      splice.map do |compare|
        COMPLEMENT[compare].to_s
      end.join('')
    end

  private

    def check_for_typos
      splice.each do |prospect|
        raise ArgumentError if COMPLEMENT[prospect] == nil
      end
    end
  end
end
