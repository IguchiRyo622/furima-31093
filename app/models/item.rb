class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :info
    validates :price
    validates :category_id
    validates :condition_id
    validates :fee_id
    validates :prefecture_id
    validates :scheduled_id
    validates :image
  end

  validates :category_id, numericality: { other_than: 1 }
end
