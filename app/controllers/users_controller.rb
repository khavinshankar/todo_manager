class UsersController < ApplicationController
  def index
    render plain: User.all.map { |user| user.to_displayable_string }.join("\n")
  end
end
