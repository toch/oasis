module Api::Controllers::Data
  class Search
    include Api::Action

    expose :blobs

    def call(params)
      repository = BlobRepository.new
      @blobs = []
      if params[:format]
        @blobs = repository.by_format(params[:format])
      elsif params[:tags]
        @blobs = repository.by_tags(params[:tags])
      else
        @blobs = repository.all
      end
    end
  end
end
