# frozen_string_literal: true
module Fumifumi
  module Api
    class Exist < Base
      def call(filename)
        response { client.get('magazines/exists', filename: filename) }.body
      end
    end
  end
end
