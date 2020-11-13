class ItemOrder
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :city, :address, :building_name, :phone, :user_id, :item_id, :token

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}+\z/, message: 'はハイフンを含む必要があります' }
    validates :prefecture_id, numericality: { other_than: 1, message: "を選択してください" }
    validates :city
    validates :address
    validates :phone, format: { with: /\A[0-9]+\z/, message: 'は数字のみを入力してください' }
    validates :user_id
    validates :item_id
  end

  def save
    item_user = ItemUser.create(item_id: item_id, user_id: user_id)
    Buyer.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone: phone, item_user_id: item_user.id)
  end
end
