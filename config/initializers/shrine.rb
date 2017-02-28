require 'shrine'
require 'shrine/storage/file_system'
require 'shrine/storage/s3'

Shrine.storages = {
    cache: Shrine::Storage::FileSystem.new('public', prefix: 'uploads/cache'),
    store: Shrine::Storage::S3.new(
        access_key_id: Rails.application.secrets.aws_access_key_id,
        secret_access_key: Rails.application.secrets.aws_secret_access_key,
        region: Rails.application.secrets.aws_region,
        bucket: Rails.application.secrets.aws_bucket
    )
}