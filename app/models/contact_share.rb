class ContactShare < ActiveRecord::Base
  validates :contact_id, :user_id, presence: true
  validates :contact_id, uniqueness: { scope: :user_id }
  validates :user_id, uniqueness: { scope: :contact_id }
  
  belongs_to(:user)
  belongs_to(:contact)
  has_many :comments, :as => :commentable
end
