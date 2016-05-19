module Pangram
  VERSION = 1
  def self.is_pangram?(string, engine=StringAnalyzer)
    engine.new(string, analyze: 'pangram').run
  end
end

module Pangram
  class StringAnalyzer

    attr_reader :string, :action

    def initialize(string, action = {} )
      @string = string
      @action = action[:analyze]
    end

    def run
      self.send(action)
    end

    def pangram
      alphabetize_string!
    end

    def alphabetize_string!
      string.split('').sort.uniq.join('').strip
    end
  end
end
