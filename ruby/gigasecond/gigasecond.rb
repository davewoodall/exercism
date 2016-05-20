module Gigasecond
  VERSION = 1

  def self.from(utc_date, start_date=AGE::Birth)
    start_date.new(utc_date).gigasecond_date
  end
end

module AGE
  class Birth
    attr_reader :utc_date, :time

    GIGASECOND = 10**9

    def initialize(utc_date, time=Time)
      @time = time
      @utc_date = utc_date
    end

    def gigasecond_date
      time.at(utc_date + GIGASECOND)
    end
  end
end
