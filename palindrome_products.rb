require 'pry'
class Palindrome
  attr_reader :value, :factors
  def initialize(value, factors)
    @value = factors[0] * factors[1]
    @factors = [factors.reverse]
  end
end

class Palindromes
  attr_reader :values, :min_factor, :max_factor, :value
  def initialize(args)
    @max_factor = args[:max_factor]
    @min_factor = args[:min_factor] || 1
    @values = []
    @factor_list = []
  end

  def generate
    total = max_factor * max_factor
    until total == min_factor
      if palindrome?(total)
        generate_factors(total)
        @values << total
      end
      total -= 1
    end
  end

  def largest
    value = @factor_list.first[0] * @factor_list.first[1]
    Palindrome.new(value, @factor_list.first)
  end


  def factors #this neds to include all the factors
    [@factor_list.first.reverse]
  end




  private

  def palindrome?(number)
    number.to_s == number.to_s.reverse
  end

  def generate_factors(palindrome_value)
    factor = max_factor
    until factor == min_factor
      if palindrome_value % factor == 0
        if palindrome_value/factor <= max_factor
          @factor_list << [factor, palindrome_value/factor]
        end
      end
      factor -= 1
    end
  end

end
