class Todo < ActiveRecord::Base
  validates :todo_text, presence: true
  validates :due_date, presence: true
  belongs_to :user

  def self.of_user(user)
    all.where(user_id: user.id)
  end

  def self.overdue
    all.where("due_date < ? and completed = false", Date.today)
  end

  def self.due_today
    all.where("due_date = ?", Date.today)
  end

  def self.due_later
    all.where("due_date > ?", Date.today)
  end

  def self.done
    all.where({ completed: true })
  end
end
