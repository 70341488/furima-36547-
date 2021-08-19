class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
        validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 
        with_options presence: true do
          validates :first_name, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}
          validates :family_name, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}
          validates :first_name_kana, format: {with: /\A[ァ-ヶー－]+\z/, message: "Namekana kana Full-width katakana characters"}
          validates :family_name_kana, format: {with: /\A[ァ-ヶー－]+\z/, message: "Family_namekana kana Full-width katakana characters"}
          validates :birth
          validates :nickname
         end
      end
