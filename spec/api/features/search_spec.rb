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
    let(:json_regexp_csv) {'{"id":"' + Uuid.regular_expression.to_s + '","format":"csv","created_at":".*","updated_at":".*","tags":{"source":"test1"}}'}
    let(:json_regexp_tsv) {'{"id":"' + Uuid.regular_expression.to_s + '","format":"tsv","created_at":".*","updated_at":".*","tags":{"source":"test2"}}'}

    before do
      repository.create(Blob.new(format: 'csv', tags: { source: 'test1'}))
      repository.create(Blob.new(format: 'tsv', tags: { source: 'test2'}))
    end
    it 'returns a page of the data without criteria' do
      get '/data'
      expect (last_response.body).must_match /#{json_regexp_csv}/
      expect (last_response.body).must_match /#{json_regexp_tsv}/
    end

    it 'returns a page of the data matching the format requested' do
      get 'data', format: 'csv'
      expect (last_response.body).must_match /\[#{json_regexp_csv}\]/
    end

    it 'returns a page of data matching the tag requested' do
      get 'data', tags: {source: 'test1'}
      expect (last_response.body).must_match /#{json_regexp_csv}/
    end

    it 'returns a page of the data matching the format and the tag requested' do
      get 'data', format: 'tsv', tags: {source: 'test1'}
      expect (last_response.body).must_equal "[]"
    end
  end
end
