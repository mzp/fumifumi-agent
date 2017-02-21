# frozen_string_literal: true
require 'pathname'
require 'webmock/rspec'

$LOAD_PATH.unshift './app'

class Spec
  class << self
    def root
      Pathname(__FILE__).join('..')
    end
  end
end
