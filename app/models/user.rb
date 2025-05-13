class User < ApplicationRecord
  has_secure_password

  has_many :accounts, dependent: :destroy
  # validates :email, presence: true, uniqueness: true
  # validates :password, length: { minimum: 2 }

end
