# frozen_string_literal: true

require 'nmax/version'

module Nmax
  class Error < StandardError; end
  require_relative 'nmax/errors/invalid_type'
  require_relative 'nmax/errors/invalid_value'
  require_relative 'nmax/cli'
end
