module Api::Views::Data
  class Search
    include Api::View
    layout false

    def render
      raw JSON.dump(blobs.map{ |blob| blob.to_h.select{ |_, v| v } })
    end
  end
end
