require 'spec_helper'
require_relative '../../../../apps/api/controllers/data/fetch'

describe Api::Controllers::Data::Fetch do
  let(:action) { Api::Controllers::Data::Fetch.new }
  let(:params) { Hash[] }

  it 'is successful' do
    skip
    response = action.call(params)
    response[0].must_equal 200
  end
end
