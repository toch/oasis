module Api::Controllers::Data
  class Index
    include Api::Action

    params do
      required(:format).filled(:str?)
      optional(:tags).maybe(:hash?)
    end

    expose :blob

    REQUIRED_METADATA = [
      :format
    ]

    def call(params)
      halt 403, "The request is invalid" unless params.valid?
      tags = params.to_h.reject{ |k, _| REQUIRED_METADATA.include? k }
      @blob = BlobRepository.new.create(Blob.new(format: params[:format], tags: tags))
    end
  end
end
