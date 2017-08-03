# config/initializers/s3.rb
require 'aws-sdk'
Aws.config.update({
   region: ENV['AWS_REGION'],
   credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'],
                                     ENV['AWS_SECRET_ACCESS_KEY'])
})

GetUrlForBlob.config(ENV['AWS_S3_BUCKET'])
