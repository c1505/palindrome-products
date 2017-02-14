class Palindromes
  attr_reader :value
  def initialize(args)
    @value = args[:max_factor]
  end

  def generate
  end

  def largest
    self
  end

  def factors
    @factors_array = []
    @factors_array << [1, self.value]
    factor1 = factor[0]
    factor2 = self.value / factor1
    @factors_array << [factor1, factor2]
    # array of arrays
  end

  def factor
    divisor = 2
    factors = []
    while divisor < self.value
      if self.value % divisor == 0
        factors << divisor
      end
      divisor += 1
    end
    factors
  end
  # def value
  #
  # end
end
