class Comment < ApplicationRecord

  validate :comment
  belongs_to :user
  belongs_to :item
end
