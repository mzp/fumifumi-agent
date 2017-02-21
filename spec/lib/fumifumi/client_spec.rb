# frozen_string_literal: true
require 'fumifumi/client'

RSpec.describe Fumifumi::Client do
  describe '#upload' do
    let(:url) { 'http://192.168.99.100:3000/api/agent/magazines' }
    let(:response) { { status: 403, body: '' } }
    before { stub_request(:post, url).and_return(response) }

    let(:path) { Spec.root.join('fixtures', 'saint_oniisan.epub') }
    it { expect { described_class.new.upload(path) }.to raise_error(Fumifumi::ResponseError) }
  end
end
