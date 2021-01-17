class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.all.map { |user| user.to_displayable_string }.join("\n")
  end

  def create
    name = params[:name]
    email = params[:email]
    passwd = params[:password]
    user = User.create!(name: name, email: email, password: passwd)
    render plain: "hey #{name}, user successfully created with an id, #{user.id}"
  end

  def login
    email = params[:email]
    passwd = params[:password]
    user = User.find_by "email = ?", email
    if !user
      render plain: "User #{email} not found"
    elsif passwd == user.password
      render plain: "true"
    else
      render plain: "false"
    end
  end
end
