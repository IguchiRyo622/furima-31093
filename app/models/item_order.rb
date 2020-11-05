class ItemOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :city, :address, :building_name, :phone, :user_id, :item_id, :item_user_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}+\z/, message: "Include hyphen(-)"}
    validates :prefecture, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :address
    validates :phone, format: {with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters."}
  end

  def save
    Buyer.create(postal_code: postal_code, prefecture_id: prefecture, city: city, address: address, building_name: building_name, phone: phone, item_user_id: item_user_id)
    ItemUser.create(item_id: item_id, user_id: user_id)
  end
end