require 'api_helper'
require 'fixtures_helper'

describe 'Searching Data' do
  let(:repository) { BlobRepository.new }
  before do
    repository.clear
    header 'Content-Type', 'application/vnd.api+json'
  end

  describe 'when oasis is empty' do
    it 'is ok' do
      get '/data'
      expect (last_response).must_be :ok?
    end

    it 'returns an empty array without criteria' do
      get '/data'
      expect (last_response.body).must_include '[]'
    end

    it 'returns an empty array with criteria' do
      get '/data', format: 'csv'
      expect (last_response.body).must_include '[]'
    end
  end

  describe 'when oasis contains some blob' do
    let(:json_regexp) {'{"id":"' + Uuid.regular_expression.to_s + '","format":"csv","created_at":".*","updated_at":".*","tags":{"source":"test"}}'}

    before do
      repository.create(Blob.new(format: 'csv', tags: { source: "test"}))
      repository.create(Blob.new(format: 'csv', tags: { source: "test"}))
    end
    it 'returns a page of the data without criteria' do
      get '/data'
      expect (last_response.body).must_match /\[#{json_regexp},#{json_regexp}\]/
    end
  end
end
