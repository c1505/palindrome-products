require 'pry'
class Palindrome
  # seems like i shouldn't implement factors twice
  #
  attr_reader :value, :factors

  def initialize(value, factors, hash_of_factors)
    @value = factors[0] * factors[1]
    @factors = [factors.reverse]
    @hash_of_factors = hash_of_factors
  end

  def factors
    @hash_of_factors
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

class Palindromes
  attr_reader :values, :min_factor, :max_factor, :value
  def initialize(args)
    @max_factor = args[:max_factor]
    @min_factor = args[:min_factor] || 1
    @values = []
    @factor_list = []
    @hash_of_factors = {}
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
    Palindrome.new(value, @factor_list.first, @hash_of_factors[value.to_s])
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
          if @hash_of_factors[palindrome_value.to_s]
            @hash_of_factors[palindrome_value.to_s] =
              @hash_of_factors[palindrome_value.to_s] + [factor, palindrome_value/factor]
          else @hash_of_factors[palindrome_value.to_s] = [factor, palindrome_value/factor]
          end
        end
      end
      factor -= 1
    end
  end

end
