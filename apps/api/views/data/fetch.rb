module Api::Views::Data
  class Fetch
    include Api::View
    layout false

    def render
      raw JSON.dump({uri: blob.uri})
    end
  end
end
