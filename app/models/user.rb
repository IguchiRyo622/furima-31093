class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname

    with_options format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'は英数字混合で入力してください' } do
      validates :password
    end

    with_options format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'は全角で入力してください' } do
      validates :last_name
      validates :first_name
    end

    with_options format: { with: /\A[ァ-ヴ]+\z/, message: 'は全角カタカナで入力してください' } do
      validates :last_name_kana
      validates :first_name_kana
    end

    validates :birth_day
  end
  has_many :items
  has_many :item_users
  has_many :comments
  has_many :reviews
end
