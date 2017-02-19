# frozen_string_literal: true
$LOAD_PATH.unshift './app'
require 'cli'

Cli.new(ARGV).run!
