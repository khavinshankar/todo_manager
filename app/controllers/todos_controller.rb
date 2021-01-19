class TodosController < ApplicationController
  def index
    render "index"
  end

  def show
    id = params[:id]
    render plain: Todo.find(id).to_displayable_string
  end

  def create
    todo_text = params[:todo_text]
    due_date = params[:due_date] != "" ? DateTime.parse(params[:due_date]) : Date.today
    todo = Todo.create!(todo_text: todo_text, due_date: due_date, completed: false)
    redirect_to todos_path
  end

  def update
    id = params[:id]
    done = params[:status]
    todo = Todo.find(id)
    todo.completed = done
    todo.save!
    redirect_to todos_path
  end

  def destroy
    id = params[:id]
    todo = Todo.find(id)
    todo.destroy
    redirect_to todos_path
  end
end
