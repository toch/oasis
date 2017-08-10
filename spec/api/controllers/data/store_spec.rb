require 'spec_helper'
require_relative '../../../../apps/api/controllers/data/store'

describe Api::Controllers::Data::Store do
  let(:action) { Api::Controllers::Data::Store.new }
  let(:params) { Hash[] }

  it 'is successful' do
    skip
    response = action.call(params)
    response[0].must_equal 200
  end
end
