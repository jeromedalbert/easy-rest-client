describe EasyRestClient do
  before do
    stub_request(:get, %r{/dogs/1}).to_return(
      headers: {
        'Content-Type': 'application/json'
      },
      body: { name: 'Fido' }.to_json
    )
  end

  describe '.get' do
    let(:response) { EasyRestClient.get('http://some-api.com/dogs/1') }

    it { expect(response.name).to eq 'Fido' }
  end

  describe '.execute' do
    let(:response) { EasyRestClient.execute(method: :get, url: 'http://some-api.com/dogs/1') }

    it { expect(response.name).to eq 'Fido' }
  end
end
