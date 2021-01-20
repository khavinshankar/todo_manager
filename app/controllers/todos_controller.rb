class TodosController < ApplicationController
  def index
    @todos = @current_user.todos
    render "index"
  end

  def create
    todo_text = params[:todo_text]
    due_date = params[:due_date] != "" ? DateTime.parse(params[:due_date]) : Date.today
    Todo.create!(
      todo_text: todo_text,
      due_date: due_date,
      completed: false,
      user_id: @current_user.id,
    )
    redirect_to todos_path
  end

  def update
    id = params[:id]
    done = params[:status]
    todo = @current_user.todos.find(id)
    todo.completed = done
    todo.save!
    redirect_to todos_path
  end

  def destroy
    id = params[:id]
    todo = @current_user.todos.find(id)
    todo.destroy
    redirect_to todos_path
  end
end
