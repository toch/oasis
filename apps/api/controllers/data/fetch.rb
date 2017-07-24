module Api::Controllers::Data
  class Fetch
    include Api::Action

    expose :blob

    def call(params)
      @blob = BlobRepository.new.find(params[:id])
      halt 404, "The data is not found" unless @blob
    end

    # http://docs.aws.amazon.com/AmazonS3/latest/API/sigv4-authentication-HTTPPOST.html
    # http://docs.aws.amazon.com/AmazonS3/latest/dev/UploadObjectPreSignedURLRubySDK.html#UploadObjectPreSignedURLRubySDKV2
    # https://leonid.shevtsov.me/post/demystifying-s3-browser-upload/
    # https://github.com/codeartists/codeartists-com/blob/master/How-to-upload-files-to-Amazon-S3-from-client-side-web-app.md
  end
end
