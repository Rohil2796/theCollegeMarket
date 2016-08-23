Paperclip.interpolates(:s3_bucket) do |attachement, style|
  Rails.application.config.paperclip_defaults[:s3_credentials][:bucket]
end