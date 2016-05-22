#
module Gigasecond
  VERSION = 1

  def self.from(utc_date, start_date=AGE::Birth, time_machine=CountBy::Seconds)
    birthday = start_date.new(utc_date)
    time_machine.new(birthday.utc_date).gigasecond_date
  end
end

module Age # Thanks, @devonestes for the suggestions
  class Birth
    attr_reader :utc_date

    def initialize(utc_date)
      @utc_date = utc_date
    end
  end
end

module CountBy
  class Seconds

    attr_reader :time, :start_time

    def initialize(start_time, time=Time )
      @start_time = start_time
      @time = time
    end

    GIGASECOND = 10**9

    def gigasecond_date
      time.at(start_time + GIGASECOND)
    end
  end
end
