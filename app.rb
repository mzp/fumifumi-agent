# frozen_string_literal: true
$LOAD_PATH.unshift './app', './lib'

require 'cli'

Cli.new(ARGV).run!
