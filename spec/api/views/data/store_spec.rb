require 'spec_helper'
require_relative '../../../../apps/api/views/data/store'

describe Api::Views::Data::Store do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Hanami::View::Template.new('apps/api/templates/data/store.html.erb') }
  let(:view)      { Api::Views::Data::Store.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #foo' do
    skip 'This is an auto-generated test. Edit it and add your own tests.'

    # Example
    view.foo.must_equal exposures.fetch(:foo)
  end
end
