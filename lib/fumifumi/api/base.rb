# frozen_string_literal: true
module Fumifumi
  module Api
    class Base
      def initialize(client)
        @client = client
      end

      private

      attr_reader :client

      def response
        yield.tap do |response|
          raise ResponseError, response.body unless response.status == 200
        end
      end
    end
  end
end
