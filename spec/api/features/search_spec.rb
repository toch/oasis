require 'api_features_helper'
require 'fixtures_helper'

describe 'Searching Data' do
  describe 'when oasis is empty' do
    it 'returns an empty array' do
      header 'Content-Type', 'application/vnd.api+json'
      get '/data?format=csv'
      expect (last_response).must_be :ok?
      expect (last_response.body).must_be '[]'
    end
  end
end
