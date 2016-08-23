class AttachedAsset < ActiveRecord::Base 
  # important associates the asset with team
  belongs_to :post
  # Paperclip
  has_attached_file :asset, :storage => :s3,
					styles: { feed: "200x200#", thumb: "100x100#" },
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials }, 
                    :s3_host_name => 's3-us-west-2.amazonaws.com',
                    :path => "/:class/:attachment/:id_partition/:style/:filename",
                    :url => ":s3_domain_url"
  # Validation of file size
  validates_with AttachmentSizeValidator, :attributes => :asset, :less_than => 5.megabytes
  # Allow users to upload following image files
  validates_attachment_content_type :asset, :content_type => /^image\/(png|gif|jpeg|jpg)/
 
  def s3_credentials
    {:bucket => "#{ ENV['S3_BUCKET'] }", :access_key_id => "#{ ENV['S3_ACCESS_KEY']}", :secret_access_key => "#{ENV['S3_SECRET_KEY']}"}
  end
end

