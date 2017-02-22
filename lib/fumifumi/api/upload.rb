# frozen_string_literal: true
module Fumifumi
  module Api
    class Upload < Base
      def call(path)
        response do
          client.post('magazines', file: Faraday::UploadIO.new(path.open, 'application/epub'))
        end
      end
    end
  end
end
