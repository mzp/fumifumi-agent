# frozen_string_literal: true
require 'fumifumi/client'

RSpec.describe Fumifumi::Client do
  describe '#upload' do
    let(:url) { 'http://192.168.99.100:3000/api/agent/magazines' }
    let(:path) { Spec.root.join('fixtures', 'saint_oniisan.epub') }

    before { stub_request(:post, url).and_return(response) }
    subject { described_class.new.upload(path) }

    context '200 OK' do
      let(:response) { { status: 200, body: '' } }
      it { expect(subject).to be_truthy }
    end

    context '403 Forbidden' do
      let(:response) { { status: 403, body: '' } }
      it { expect { subject }.to raise_error(Fumifumi::ResponseError) }
    end
  end
end
