module Api::Controllers::Data
  class Search
    include Api::Action

    params do
      optional(:format).maybe(:str?)
      optional(:tags).maybe(:hash?)
    end

    expose :blobs

    def call(params)
      return [] unless params.valid?
      repository = BlobRepository.new
      @blobs = repository.find_by(params)
    end
  end
end
