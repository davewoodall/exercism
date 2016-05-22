module Complement
  VERSION = 3
  def self.of_dna(fixture, complementer=Tool::Complementer)
    complementer.new(fixture).complement
  end
end

module Tool
  class Complementer

    DNA_COMPLEMENTS = {
      'G' => 'C',
      'C' => 'G',
      'T' => 'A',
      'A' => 'U'
    }

    attr_reader :nuc, :result

    def initialize(nucleotides)
      @nuc = nucleotides
      check_for_typos
    end

    def complement
      @result ||= nuc.gsub(/./,DNA_COMPLEMENTS) # sweet! Thanks, @tnordloh!
    end

  private

    def nucleotides
      @nucleotides ||= nuc.chars # thanks, @bcc32 for memoize catch!
    end

    def check_for_typos
      nucleotides.each do |prospect|
        raise ArgumentError if DNA_COMPLEMENTS[prospect] == nil
      end
    end
  end
end
