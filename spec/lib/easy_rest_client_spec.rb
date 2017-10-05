require 'spec_helper'

describe EasyRestClient do

  before do
    stub_request(:get, %r{/apples/1}).to_return(
      headers: { 'Content-Type': 'application/json' },
      body: { name: 'golden' }.to_json
    )
  end

  describe '.get' do
    let(:response) { EasyRestClient.get('http://some-api.com/apples/1') }

    it { expect(response.name).to eq 'golden' }
  end

  describe '.execute' do
    let(:response) do
      EasyRestClient.execute(method: :get, url: 'http://some-api.com/apples/1')
    end

    it { expect(response.name).to eq 'golden' }
  end

end
