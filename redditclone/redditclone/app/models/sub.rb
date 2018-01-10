class Sub < ApplicationRecord
  validates :description, presence: true
  validates :title, presence: true, uniqueness: true

  belongs_to :moderator,
  foreign_key: :user_id,
  class_name: :User

  # has_many :crossposts,
  # foreign_key: :sub_id,
  # class_name: :PostSub

  has_many :post_subs


  has_many :posts,
  through: :post_subs

end
