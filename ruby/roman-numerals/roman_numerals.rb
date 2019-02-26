module RomanConversion

  def to_roman
    from_arabic
  end

private

  CONVERSIONS = {
    1000 => 'M',
    900 => 'CM',
    800 => 'DCCC',
    700 => 'DCC',
    600 => 'DC',
    500 => 'D',
    400 => 'CD',
    100 => 'C',
    90 => 'XC',
    80 => 'LXXX',
    70 => 'LXX',
    60 => 'LX',
    50 => 'L',
    40 => 'XL',
    10 => 'X',
    9 => 'IX',
    8 => 'VIII',
    7 => 'VII',
    6 => 'VI',
    5 => 'V',
    4 => 'IV',
    1 => 'I'
  }

  def from_arabic
    base_chart = {
      1000 => 0,
      100  => 0,
      10   => 0,
      1    => 0
    }
    arabic = factor_arabic(self, base_chart)
    convert(arabic)
  end

  def convert(arabic)
    map_numbers(arabic).join('')
  end

  def map_numbers(arabic)
    arabic.map do |pos, arabic_factor|
      if natural_roman(arabic_factor)
         natural_roman(arabic_factor)
      else
        synthetic_roman(pos, arabic_factor)
      end
    end
  end

  def natural_roman(arabic_factor)
    CONVERSIONS[arabic_factor]
  end

  def synthetic_roman(base_chart, arabic_factor)
    marble_slab = ""
    chisle = arabic_factor / base_chart
    chisle.times do |s|
      marble_slab += CONVERSIONS[base_chart]
    end
    marble_slab
  end

  def factor_arabic(arabic_factor, base_chart)
    case
    when arabic_factor > 1000
      remainder = arabic_factor % 1000
      base_chart[1000] = arabic_factor - remainder
      factor_arabic(remainder, base_chart)
    when arabic_factor > 100
      remainder = arabic_factor % 100
      base_chart[100] = arabic_factor - remainder
      factor_arabic(remainder, base_chart)
    when arabic_factor > 10
      remainder = arabic_factor % 10
      base_chart[10] = arabic_factor - remainder
      factor_arabic(remainder, base_chart)
    else
      remainder = arabic_factor % 1
      base_chart[1] = arabic_factor - remainder
    end
    base_chart
  end
end

class Integer
  include RomanConversion
end
