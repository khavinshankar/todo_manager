class Todo < ActiveRecord::Base
  def to_displayable_string
    done = completed ? "[X]" : "[ ]"
    "#{id}. #{done} #{todo_text} #{due_date.to_s(:long)}"
  end
end
