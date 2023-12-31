class User < ApplicationRecord
    has_many :blogs, foreign_key: :user_id, dependent: :destroy
    validates :username, presence: true, length: { minimum: 2 }
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password, presence: true, length: { in: 6..30 }, confirmation: true
end
