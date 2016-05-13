class Gigasecond
  VERSION = 1
  class << self
    def from(time, birthday=AGE::Birth)
      seconds = birthday.new(time).in_seconds
    end
  end
end

module AGE
  class Birth
    attr_reader :time

    def initialize(time)
      @time = time
    end

    def in_seconds
      time.to_i
    end
  end
end
