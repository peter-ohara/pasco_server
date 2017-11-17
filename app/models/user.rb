class User < ApplicationRecord
  has_secure_password

  has_many :purchases, inverse_of: :user
  has_many :courses, through: :purchases
end
