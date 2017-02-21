# frozen_string_literal: true
require 'faraday'
require 'faraday_middleware'
require 'fumifumi/api/base'
require 'fumifumi/api/upload'
require 'fumifumi/response_error'

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
      response { Api::Upload.new(client).call(path) }
    end

    private

    def response
      yield.tap do |response|
        raise ResponseError, response.body unless response.status == 200
      end
    end

    def client
      @client ||= self.class.build_client
    end
  end
end
