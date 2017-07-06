require "api_features_helper"
require "fixtures_helper"

describe "Ingest Data" do
  it "is successful" do
    header "Content-Type", "application/vnd.api+json"
    post "/ingest", "{}"
    expect (last_response).must_be :ok?
  end
end
