# frozen_string_literal: true
require 'uri'

module Fumifumi
  class << self
    def config
      Config.init!(&Proc.new)
    end
  end

  class Config
    class Builder
      attr_reader :config

      def initialize
        @config = {}
      end

      def url(url)
        config[:url] = URI(url)
      end
    end

    class << self
      def init!
        builder = Builder.new
        builder.instance_eval(&Proc.new)
        @config = builder.config
      end

      def method_missing(name)
        config[name] || super
      end

      def respond_to_missing?(name)
        config.key?(name) || super
      end

      private

      def config
        @config || {
          url: 'http://localhost'
        }
      end
    end
  end
end
