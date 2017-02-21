# frozen_string_literal: true
require 'faraday'
require 'faraday_middleware'

module Fumifumi
  class Client
    def upload(path)
      client.post('magazines', file: Faraday::UploadIO.new(path.open, 'application/epub'))
    end

    def client
      @client ||= Faraday.new(
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
end
