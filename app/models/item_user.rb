class ItemUser < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :buyer
  has_one :review
end
