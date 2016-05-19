module Pangram
  VERSION = 1
  def self.is_pangram?(string, engine=Engine::StringAnalyzer)
    engine.new(string, analyze: 'pangram').run
  end
end

module Engine
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
      judge alphabetize_string!
    end

  private

    def alphabetize_string!
      string.split('').sort.uniq.join('')
    end

    def judge(string)
      alf = ('a'..'z').to_a

      string.split('').each do |letter|
        alf.delete(letter.downcase)
      end

      if alf.length == 0
        true
      else
        false
      end
    end
  end
end
