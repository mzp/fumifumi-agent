# frozen_string_literal: true
require 'pathname'
require 'fumifumi'

class Cli
  def initialize(dirs)
    @dirs = dirs
  end

  def run!
    dirs.each do |dir|
      glob(dir, '**/*.epub') do |path|
        puts path.basename.to_s
        if client.exist?(path.basename)
          puts '--> skip'
        else
          client.upload(path)
        end
      end
    end
  end

  private

  attr_reader :dirs

  def glob(base, pattern)
    path = Pathname.new(base).join(pattern)
    Pathname.glob(path, &Proc.new)
  end

  def client
    @client ||= Fumifumi::Client.new
  end
end
