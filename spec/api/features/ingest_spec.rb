require "api_features_helper"
require "fixtures_helper"

describe "Ingesting Data" do
  it "is successful" do
    skip
    header "Content-Type", "application/vnd.api+json"
    post "/data", "{}"
    expect (last_response).must_be :ok?
  end
end
