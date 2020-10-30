class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :info
    validates :category_id
    validates :condition_id
    validates :fee_id
    validates :prefecture_id
    validates :scheduled_id
    validates :image
    validates :price
  end
    validates :category_id, numericality: { other_than: 1, message: 'Select'}
    validates :condition_id, numericality: { other_than: 1, message: 'Select'}
    validates :fee_id, numericality: { other_than: 1, message: 'Select'}
    validates :prefecture_id, numericality: { other_than: 1, message: 'Select'}
    validates :scheduled_id, numericality: { other_than: 1, message: 'Select'}
    
    with_options format: { with: /\A[3-9][0-9]{2}|[1-9][0-9]{3,6}+\z/, message: 'Out of setting range' } do
      validates :price
    end
end
