class Contact < ActiveRecord::Base
  validates :email, presence: true, uniqueness: { scope: :user_id }
  validates :name, :user_id, presence: true
  
  belongs_to(
    :owner,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id
  )
  
  has_many(:shares, 
           class_name: "ContactShare",
           dependent: :destroy)
  
  has_many(:shared_users, through: :shares, source: :user)
  
  has_many :comments, :as => :commentable
  
  
  
end
