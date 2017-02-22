# frozen_string_literal: true
require 'fumifumi'

RSpec.describe Fumifumi::Api::Exist do
  let(:url) { 'http://192.168.99.100:3000/api/agent/magazines/exists?filename=foo.epub' }
  before { stub_request(:get, url).and_return(response) }

  let(:client) { Fumifumi::Client.build_client }
  let(:filename) { 'foo.epub' }
  subject { described_class.new(client).call(filename) }

  context 'exist' do
    let(:response) { { status: 200, body: 'true' } }
    it { expect(subject).to be_truthy }
  end

  context 'non exist' do
    let(:response) { { status: 200, body: 'false' } }
    it { expect(subject).to be_falsy }
  end

  context 'error' do
    let(:response) { { status: 404, body: 'false' } }
    it { expect { subject }.to raise_error(Fumifumi::ResponseError) }
  end
end
