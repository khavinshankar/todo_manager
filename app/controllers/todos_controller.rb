class TodosController < ApplicationController
  def index
    @todos = @current_user.todos
    render "index"
  end

  def create
    todo_text = params[:todo_text]
    due_date = params[:due_date] # params[:due_date] != "" ? DateTime.parse(params[:due_date]) : Date.today
    todo = Todo.new(
      todo_text: todo_text,
      due_date: due_date,
      completed: false,
      user_id: @current_user.id,
    )

    if !todo.save
      flash[:error] = todo.errors.full_messages.join(", ")
    end

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
