class User < ActiveRecord::Base
  validates :first_name, presence: true
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 8 }
  has_secure_password
  has_many :todos
end
