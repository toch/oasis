require 'api_helper'
require 'fixtures_helper'

describe 'Searching Data' do
  let(:repository) { BlobRepository.new }
  before do
    repository.clear
    header 'Content-Type', 'application/vnd.api+json'
  end

  describe 'when oasis is empty' do
    it 'is not found' do
      get '/data/f337ee46-1f2c-4513-b860-699d658adc1f'
      expect (last_response).must_be :not_found?
    end
  end

  describe 'when oasis contains some blob' do
    let(:uri) { "https://873895678023687646.s3.amazonaws.com/312986794569186" }
    let(:blob) {
      repository.create(Blob.new(format: 'csv', tags: { source: 'test1'}, uri: uri))
    }
    let(:uuid) { blob.id }

    describe 'when the UUID corresponds to an existing blob' do
      it 'is ok' do
        get "/data/#{uuid}"
        expect (last_response).must_be :ok?
      end

      it 'returns the direct URI to download it' do
        get "/data/#{uuid}"
        expect (last_response.body).must_match /https:\/\/[a-z0-9][a-z0-9-\.]*\.s3\.amazonaws\.com\/[a-z0-9][a-zA-Z0-9]*/
      end
    end

  end

end
