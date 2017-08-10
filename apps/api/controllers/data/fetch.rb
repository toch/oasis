module Api::Controllers::Data
  class Fetch
    include Api::Action

    params do
      required(:id).filled(:str?, format?: Uuid.regular_expression)
    end

    expose :blob

    def call(params)
      halt 403, "The request is invalid" unless params.valid?
      @blob = BlobRepository.new.find(params[:id])
      halt 404, "The data is not found" unless @blob

      url = GetUrlForBlob.call(@blob)
      redirect_to url
    end

    # http://docs.aws.amazon.com/AmazonS3/latest/API/sigv4-authentication-HTTPPOST.html
    # http://docs.aws.amazon.com/AmazonS3/latest/dev/UploadObjectPreSignedURLRubySDK.html#UploadObjectPreSignedURLRubySDKV2
    # https://leonid.shevtsov.me/post/demystifying-s3-browser-upload/
    # https://github.com/codeartists/codeartists-com/blob/master/How-to-upload-files-to-Amazon-S3-from-client-side-web-app.md
    # http://docs.aws.amazon.com/sdk-for-ruby/v2/developer-guide/stubbing.html
  end
end
