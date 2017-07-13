require 'api_helper'
require 'fixtures_helper'

describe 'Searching Data' do
  before do
    header 'Content-Type', 'application/vnd.api+json'
  end

  describe 'when oasis is empty' do
    it 'is ok' do
      get '/data'
      expect (last_response).must_be :ok?
    end

    it 'returns an empty array without criteria' do
      get '/data'
      expect (last_response.body).must_be '[]'
    end

    it 'returns an empty array with criteria' do
      get '/data', format: 'csv'
      expect (last_response.body).must_be '[]'
    end
  end

  describe 'when oasis contains some data' do
    it 'returns a page of the data without criteria' do
      get '/data'
      expect (last_response.body).must_be '[]'
    end
  end
end
