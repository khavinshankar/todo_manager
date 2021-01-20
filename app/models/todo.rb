class Todo < ActiveRecord::Base
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
