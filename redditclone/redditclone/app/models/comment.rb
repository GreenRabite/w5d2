class Comment < ApplicationRecord
  validates :content, presence: true
  belongs_to :post
  belongs_to :user

  belongs_to :parent_comment,
  primary_key: :id,
  foreign_key: :parent_id,
  class_name: :Comment,
  optional: true

  has_many :replies,
  primary_key: :id,
  foreign_key: :parent_id,
  class_name: :Comment
end
