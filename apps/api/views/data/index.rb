module Api::Views::Data
  class Index
    include Api::View

    layout false

    def render
      raw JSON.dump(blob.to_h.select{ |_, v| v })
    end
  end
end
