# frozen_string_literal: true

# A class with an error that is thrown if the argument type specified is incorrect

module Nmax
  module Errors
    class InvalidType < ArgumentError
      def initialize
        super('Strings are evil! Please enter a digit.')
      end
    end
  end
end
