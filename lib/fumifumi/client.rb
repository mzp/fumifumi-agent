# frozen_string_literal: true
require 'faraday'
require 'faraday_middleware'

module Fumifumi
  class Client
    class << self
      def build_client
        Faraday.new(
          url: 'http://192.168.99.100:3000/api/agent',
          headers: { user_agent: 'Fumifumi Rsync Agent' }
        ) do |faraday|
          faraday.request :multipart
          faraday.response :json
          faraday.response :logger
          faraday.adapter  Faraday.default_adapter
        end
      end
    end

    def upload(path)
      Api::Upload.new(client).call(path)
    end

    private

    def client
      @client ||= self.class.build_client
    end
  end
end
