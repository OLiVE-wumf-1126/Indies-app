require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'


CarrierWave.configure do |config|
  if Rails.env.development? || Rails.env.test? #開発とテストは今まで通りに保存する
    config.storage = :file
  elsif Rails.env.production? #本番はS3に保存する
    config.storage = :fog
    config.fog_provider = 'fog-aws'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: Rails.application.credentials[:AWS_ACCESS_KEY_ID],
      aws_secret_access_key: Rails.application.credentials[:AWS_SECRET_ACCESS_KEY],
      region: 'ap-northeast-1'
    }
    config.fog_directory  = 'indies-app-baqet'
  end
end