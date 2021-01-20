class User < ActiveRecord::Base
  has_secure_password
  has_many :todos

  def to_displayable_string
    "#{id}. #{name} #{email}"
  end
end
