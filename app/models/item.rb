class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled

  belongs_to :user
  has_one :item_user
  has_one_attached :image
  has_one :order
  has_many :comments
  has_many :reviews

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

  with_options numericality: { other_than: 1, message: 'を選択してください' } do
    validates :category_id
    validates :condition_id
    validates :fee_id
    validates :prefecture_id
    validates :scheduled_id
  end

  with_options format: { with: /\A([3-9][0-9]{2}|[1-9][0-9]{3,7})+\z/, message: 'は(¥300〜9,999,999)内にしてください' } do
    validates :price
  end
  with_options format: { with: /\A[0-9]+\z/, message: 'は半角数字で入力してください' } do
    validates :price
  end

  def self.search(search)
    if search != ''
      Item.where(['name LIKE(?) OR info LIKE(?)', "%#{search}%", "%#{search}%"])
    else
      Item.all
    end
  end
end
