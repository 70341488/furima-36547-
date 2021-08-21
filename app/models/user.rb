class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :items

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'is invalid. Include both letters and numbers'
  with_options presence: true do
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: 'Full-width characters' }
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: 'Full-width characters' }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'Namekana kana Full-width katakana characters' }
    validates :family_name_kana,
              format: { with: /\A[ァ-ヶー－]+\z/, message: 'Family_namekana kana Full-width katakana characters' }
    validates :birth_date
    validates :nickname
  end
end
