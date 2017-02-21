# frozen_string_literal: true
require 'fumifumi/client'

RSpec.describe Fumifumi::Api::Upload do
  let(:url) { 'http://192.168.99.100:3000/api/agent/magazines' }
  let(:response) { { status: 200, body: '' } }
  before { stub_request(:post, url).and_return(response) }

  let(:client) { Fumifumi::Client.build_client }
  let(:path) { Spec.root.join('fixtures', 'saint_oniisan.epub') }
  subject { described_class.new(client).call(path) }

  it { expect(subject).to be_truthy }
end
