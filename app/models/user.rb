class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :password,
              format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/,
                        message: 'is invalid. Input half-width alphanumeric characters.' }
    validates :nickname
    validates :first_name, :last_name,
              format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'is invalid. Input full-width characters.' }
    validates :first_name_read, :last_name_read,
              format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters.' }
    validates :birth_day
  end
end
