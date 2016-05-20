module Complement
  VERSION = 3
  def self.of_dna(fixture, complementer=Tool::Complementer)
    complementer.new(fixture).complement
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

    def split
      split ||= nuc.split('') # good call on ||= 
    end

    def complement
      nuc.gsub(/./,COMPLEMENT) # sweet! Thanks, @tnordloh!
    end

  private

    def check_for_typos
      split.each do |prospect|
        raise ArgumentError if COMPLEMENT[prospect] == nil
      end
    end
  end
end
