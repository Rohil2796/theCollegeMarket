class Post < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories 
  default_scope -> { order(created_at: :desc) }

  validates :user_id, presence: true
  validates :name,  presence: true, length: { maximum: 70 }
  validates :description, length: { maximum: 1000 }
  validates :expiredate, :date => {:after => Proc.new { Time.now },
  								   :before => Proc.new {Time.now + 6.months }}

  enum status: { active: 0, inactive: 1, sold: 2 }
  validates :status, inclusion: { in: statuses.keys }

  enum offerrequest: { offer: 0, request: 1 }
  validates :offerrequest, inclusion: { in: offerrequests.keys }

  
end
 