class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true

  VALID_LAST_NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/.freeze
  validates :last_name, presence: true, format: { with: VALID_LAST_NAME_REGEX }

  VALID_FIRST_NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/.freeze
  validates :first_name, presence: true, format: { with: VALID_FIRST_NAME_REGEX }


  VALID_LAST_NAME_KANA_REGEX = /\A[ァ-ヶ一]+\z/.freeze
  validates :last_name_kana, presence: true, format: { with: VALID_LAST_NAME_KANA_REGEX }


  VALID_FIRST_NAME_KANA_REGEX = /\A[ァ-ヶ一]+\z/.freeze
  validates :first_name_kana, presence: true, format: { with: VALID_FIRST_NAME_KANA_REGEX }


  validates :birth_date, presence: true

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX }
end