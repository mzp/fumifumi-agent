require 'pathname'
require 'fumifumi'

class Cli < Struct.new(:dirs)
  def run!
    dirs.each do |dir|
      glob(dir, '**/*.epub') do |path|
        puts path.to_s
        client.upload(path)
      end
    end
  end

  private

  def glob(base, pattern)
    path = Pathname.new(base).join(pattern)
    Pathname.glob(path, &Proc.new)
  end

  def client
    @client ||= Fumifumi::Client.new
  end
end
