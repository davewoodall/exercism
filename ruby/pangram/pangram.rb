module Pangram
  VERSION = 1
  def self.is_pangram?(string, engine=StringAnalyzer)
    engine.new(string, task: :pangram).run_task
  end
end

class PangramAnalyzer
  attr_reader :string

  def initialize(string)
    @string = string
  end

  def run
    is_pangram? normalize_string
  end

private

  def normalize_string
    string.chars.sort.uniq.join
  end

  def is_pangram?(string)
    alf = ('a'..'z').to_a

    string.split('').each do |letter|
      alf.delete(letter.downcase)
    end

    alf.length == 0 # nice! Thanks, @rbndickson
  end
end

class StringAnalyzer
  attr_reader :action

  ANALYZERS = {
    pangram: PangramAnalyzer,
    # pretend: PretendAnalyzer
  }

  def initialize(string, selected={} )
    analyzer = ANALYZERS[selected[:task]]
    @action = analyzer.new(string)
  end

  def run_task
    action.run
  end
end
