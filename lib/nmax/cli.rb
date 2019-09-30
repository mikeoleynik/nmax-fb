# frozen_string_literal: true

module Nmax
  class Cli
    MIN_SIZE = 1
    MAX_SIZE = 1000
    REGEXP_FOR_FIND = /\d{#{MIN_SIZE},#{MAX_SIZE}}/.freeze

    attr_reader :number, :text

    def initialize(text, number)
      @text = text
      @number = number
    end

    def calculate_number
      numbers_of_digit = text.scan(REGEXP_FOR_FIND).map(&:to_i).uniq
      if numbers_of_digit.empty?
        'No digits found'
      else
        numbers_of_digit.max(number.to_i)
      end
    end
  end
end
