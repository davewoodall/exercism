# Comments
# Ruby is an object oriented language.
# So I'm trying to practice working with objects.
# I'm also practicing Dependency Injection per Sandy Metz.
# Because Raindrops might change the criterial
# for a song (ex. even numbers). 
# It could also change the type of song (ex. Fizz Buzz).
# The numbers to create the criteria for notes is different
# than the notes themselves. I wanted to manage them as
# separate objects and Inject them into the method without
# hard coding them into the Raindrops module.


module Raindrops
  VERSION = 1
  def self.convert(number,
                   optimus = Rain::OptimusPrimes,
                   song    = Rain::PlingPlangPlong )

    processed_number = optimus.new(number).transform
    song.new(processed_number).play
  end
end

module Rain
  class PlingPlangPlong

    NOTES = {
      '3' => 'Pling',
      '5' => 'Plang',
      '7' => 'Plong'
    }

    attr_reader :number, :copy

    def initialize(number)
      @copy   = number
      @number = number
    end

    def play
      align_notes.join('')
    end

    def align_notes
      filtered = number.map { |num| NOTES[num.to_s] }
      if filtered.compact.empty?
        copy
      else
        filtered
      end
    end
  end
end

module Rain
  class OptimusPrimes

    attr_reader :number, :tally

    def initialize(number)
      @number = number
      @tally = {input: number}
    end

    def transform
      go_fish
      catch_and_release! # add bang to show it mutates object
      filet_fish! # add bang to show it mutates object
    end

    def go_fish
      tally.merge!({
        3 => got_any?(3),
        5 => got_any?(5),
        7 => got_any?(7)
      })
    end

    def got_any?(n)
      number % n == 0
    end

    def catch_and_release!
      tally.select! { |k,v| v == true || k == :input }
    end

    def filet_fish!
      tally.map { |k,v| k == :input ? v : k }.uniq
    end
  end
end
