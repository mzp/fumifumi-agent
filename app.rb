# frozen_string_literal: true
$LOAD_PATH.unshift './app'
$LOAD_PATH.unshift './lib'

require 'cli'

Cli.new(ARGV).run!
