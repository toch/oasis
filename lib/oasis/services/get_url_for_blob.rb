require 'aws-sdk'

class GetUrlForBlob
  def self.call(blob, method=:download)
    new(blob).send(:generate_url, method == :upload ? :put : :get)
  end

  def self.config(s3_bucket)
    @@s3_bucket = s3_bucket
  end

  private_class_method :new
  private
  attr_reader :object

  def initialize(blob)
    @object = client.get_object(bucket: @@s3_bucket, key: blob.id)
  end

  def generate_url(method=:get)
    object.presigned_url(method, expires_in: 60*10)
  end

  def client
    @client ||= Aws::S3::Client.new()
  end
end
