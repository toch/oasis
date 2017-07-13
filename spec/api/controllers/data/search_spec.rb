require 'spec_helper'
require_relative '../../../../apps/api/controllers/data/search'

describe Api::Controllers::Data::Search do
  let(:action) { Api::Controllers::Data::Search.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
