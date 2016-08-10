class Post < ApplicationRecord

  belongs_to :user

  belongs_to :category, :foreign_key => "category_id"
    accepts_nested_attributes_for :category

  
  default_scope -> { order(created_at: :desc) }
  
  has_many :post_attachments
  accepts_nested_attributes_for :post_attachments


  validates :user_id, presence: true
  validates :name,  presence: true, length: { maximum: 70 }
  validates :description, length: { maximum: 1000 }
  # validates :expiredate,     date: { after: Proc.new { Time.now },
  #                 					before: Proc.new { Time.now + 1.year } }


  enum status: { active: 0, inactive: 1, sold: 2 }
  validates :status, inclusion: { in: statuses.keys }

  enum postitemservice: { "Item" => 0, "Service" => 1 }




  enum offerrequest: { offer: 0, request: 1 }
  validates :offerrequest, inclusion: { in: offerrequests.keys }

  
end
