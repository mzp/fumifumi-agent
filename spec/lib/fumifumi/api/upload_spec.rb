# frozen_string_literal: true

RSpec.describe Fumifumi::Api::Upload do
  let(:url) { 'http://192.168.99.100:3000/api/agent/magazines' }
  before { stub_request(:post, url).and_return(response) }

  let(:client) { Fumifumi::Client.build_client }
  let(:path) { Spec.root.join('fixtures', 'saint_oniisan.epub') }

  subject { described_class.new(client).call(path) }

  context 'success' do
    let(:response) { { status: 200, body: '' } }
    it { expect(subject).to be_truthy }
  end

  context 'error' do
    let(:response) { { status: 403, body: '' } }
    it { expect { subject }.to raise_error(Fumifumi::ResponseError) }
  end
end
