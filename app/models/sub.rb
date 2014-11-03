class Sub < ActiveRecord::Base
  validates :moderator, :title, :description, presence: true
  validates :title, :description, uniqueness: true

  has_many :posts, dependent: :destroy

  belongs_to(
   :moderator,
   class_name: 'User',
   foreign_key: :moderator_id,
   primary_key: :id
  )

  has_many :post_subs
  # has_many :posts, through: :post_subs, source: :post

end
