require 'spec_helper'
require_relative '../../../../apps/api/controllers/data/index'

describe Api::Controllers::Data::Index do
  let(:action) { Api::Controllers::Data::Index.new }
  let(:params) { Hash[format: "csv"] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
