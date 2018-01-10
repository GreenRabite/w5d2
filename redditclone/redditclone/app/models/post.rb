class Post < ApplicationRecord
  validates :title, presence: true

  belongs_to :sub

  belongs_to :author,
  foreign_key: :user_id,
  class_name: :User

  has_many :post_subs

  has_many :subs,
  through: :post_subs

end
