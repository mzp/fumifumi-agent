# frozen_string_literal: true
$LOAD_PATH.unshift './app', './lib'

require 'cli'
require_relative './config/config.rb' if File.exist?('./config/config.rb')

Cli.new(ARGV).run!
