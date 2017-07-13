module Api::Controllers::Data
  class Search
    include Api::Action

    expose :blobs

    def call(params)
      @blobs = BlobRepository.new.all
    end
  end
end
