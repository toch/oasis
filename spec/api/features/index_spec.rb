require 'api_helper'
require 'fixtures_helper'

describe 'Index Data' do
  let(:repository) { BlobRepository.new }
  before do
    repository.clear
    header 'Content-Type', 'application/vnd.api+json'
  end

  describe 'when the metadata provided is valid' do
    let(:metadata) { '{"format":"csv","source":"test1"}' }
    it 'is successful' do
      post '/data', metadata
      expect (last_response).must_be :ok?
    end

    it 'returns the id of the indexed data' do
      post 'data', metadata
      expect (last_response.body).must_match Uuid.regular_expression
    end

    it 'is stored into the repository' do
      post 'data', metadata
      response = JSON.parse(last_response.body)
      blob_created = repository.find(response["id"])
      expect (blob_created.tags[:source]).must_equal "test1"
    end
  end

  describe 'when the metadata provided is invalid' do
    let(:metadata_without_format) { '{"source":"test1"}' }
    it 'is forbidden' do
      post '/data', metadata_without_format
      expect (last_response).must_be :forbidden?
    end
  end
end
