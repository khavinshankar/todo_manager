class User < ActiveRecord::Base
  has_many :todos

  def to_displayable_string
    "#{id}. #{name} #{email}"
  end
end
