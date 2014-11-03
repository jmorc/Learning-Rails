class Post < ActiveRecord::Base

  validates :title, :author, presence: true
  validates :title, uniqueness: true

  belongs_to(
    :author,
    class_name: 'User',
    foreign_key: :author_id,
    primary_key: :id
  )

  # belongs_to :sub

  has_many :post_subs
  has_many :subs, through: :post_subs, source: :sub
  has_many :comments
end
