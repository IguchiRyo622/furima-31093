class ItemOrder
  include ActiveModel::Model
  attr_accessor :postal_cord, :prefecture, :city, :address, :building_name, :phone, :user_id, :item_id, :item_user_id

  with_options presence: true do
    validate postal_cord, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validate prefecture, numericality: { other_than: 1, message: "can't be blank" }
    validate city
    validate address
    validate phone, format: {with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters."}
  end

  def save
    Buyer.create(postal_code: postal_code, prefecture: prefecture.id, city: city, address: address, building_name: building_name, phone: phone, item_user_id: item_user.id)
    ItemUser.create(item_id: item.id, user_id: user.id)
  end
end