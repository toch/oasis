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
    @object = get_s3_object(blob.id)
  end

  def generate_url(method=:get)
    object.presigned_url(method, expires_in: 60*10)
  end

  def get_s3_object(id)
    @s3_resource ||= Aws::S3::Resource.new(client: Aws::S3::Client.new())
    @s3_resource.bucket(@@s3_bucket).object(id)
  end
end
