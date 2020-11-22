class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        
         with_options presence: true do
          validates :nickname
          VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
          validates :email, format: { with: VALID_EMAIL_REGEX}, allow_blank: true
          VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}\z/i.freeze
          validates :password, format: { with: VALID_PASSWORD_REGEX}, allow_blank: true
          validates :last_name, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, allow_blank: true }
          validates :first_name, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, allow_blank: true }
         end
end
