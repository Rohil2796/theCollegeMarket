class Post < ApplicationRecord

  belongs_to :user

  belongs_to :category, :foreign_key => "category_id"
    accepts_nested_attributes_for :category

  has_many :attached_assets, dependent: :destroy
  # tell the model to accept the nested attributes for attached_assets
  accepts_nested_attributes_for :attached_assets

  
  default_scope -> { order(created_at: :desc) }
  
 


  validates :user_id, presence: true
  validates :name,  presence: true, length: { maximum: 70 }, uniqueness: { 
    message: "This title has already been taken - please don't spam our community! :)" }
  validates :description, length: { maximum: 1000 }
  VALID_PRICE_REGEX = /\A[0-9]\z/
  validates :price, presence: true, length: { maximum: 5, message: 'Price must be a number, and less than $10,000'}, format: { with: VALID_PRICE_REGEX, message: 'Price must be a number, and less than $10,000' }
  validates :category_id, presence: true

  # validates :expiredate,     date: { after: Proc.new { Time.now },
  #      dd           					before: Proc.new { Time.now + 1.year } }


  enum status: { active: 0, inactive: 1, sold: 2 }
  validates :status, inclusion: { in: statuses.keys }

  enum postitemservice: { "Item" => 0, "Service" => 1 }




  enum offerrequest: { offer: 0, request: 1 }
  validates :offerrequest, inclusion: { in: offerrequests.keys }

  
end
