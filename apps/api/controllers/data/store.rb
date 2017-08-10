module Api::Controllers::Data
  class Store
    include Api::Action

    params do
      required(:id).filled(:str?, format?: Uuid.regular_expression)
    end

    def call(params)
      halt 403, "The request is invalid" unless params.valid?

      @blob = BlobRepository.new.find(params[:id])
      halt 404, "The data is not found" unless @blob

      url = GetUrlForBlob.call(@blob)
      redirect_to url, status: 307
    end
  end
end
