require 'api_helper'
require 'fixtures_helper'
require 'aws-sdk'

FakeS3Object = Struct.new(:stubbed_url) do
  def presigned_url(_, _)
    stubbed_url
  end
end

describe 'Fetching Data' do
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
    let(:s3_object_uri) { "https://873895678023687646.s3.amazonaws.com/312986794569186" }
    let(:blob) {
      repository.create(Blob.new(format: 'csv', tags: { source: 'test1'}))
    }
    let(:uuid) { blob.id }

    before do
      Aws.config[:s3] = { stub_responses: true }
      uri = s3_object_uri
      GetUrlForBlob.send(:define_method, :get_s3_object) do |_|
        FakeS3Object.new(uri)
      end
    end

    describe 'when the UUID corresponds to an existing blob' do
      it 'is ok' do
        get "/data/#{uuid}"
        expect(last_response).must_be :redirect?
      end

      it 'returns the direct URI to download it' do
        get "/data/#{uuid}"
        follow_redirect!
        expect (last_request.url).must_equal s3_object_uri
      end
    end

    describe 'when the id is an invalid format' do
      it 'is forbidden' do
        get 'data/1'
        expect(last_response).must_be :forbidden?
      end
    end

  end

end
