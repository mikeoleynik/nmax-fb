# frozen_string_literal: true

module Nmax
  class Cli
    MIN_SIZE = 1
    MAX_SIZE = 1000
    REGEXP_FOR_FIND = /\d{#{MIN_SIZE},#{MAX_SIZE}}/.freeze

    attr_reader :number, :text

    # reads the transmitted text
    # exception if number is not entered
    # or setting incorrect type for the number of digits
    def initialize(text, number)
      @text = text
      @number = number
      validate!
    end

    # returns an array of digits if all is successful
    # or message, if nothing not found
    def find_digits
      numbers_of_digit = text.scan(REGEXP_FOR_FIND).map(&:to_i).uniq
      if numbers_of_digit.empty?
        'No digits found'
      else
        numbers_of_digit.max(number.to_i)
      end
    end

    private

    def validate!
      raise Nmax::Errors::InvalidValue if number.nil?
      raise Nmax::Errors::InvalidType unless number.match?(/\d/)

      true
    end
  end
end
