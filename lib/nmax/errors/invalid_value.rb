# frozen_string_literal: true

# A class with an error that is thrown if no argument

module Nmax
  module Errors
    class InvalidValue < ArgumentError
      def initialize
        super("Number can't be nil. Please enter the number of digits.")
      end
    end
  end
end
