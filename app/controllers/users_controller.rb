class UsersController < ApplicationController
  def index
    render plain: User.order(:id).map { |user| user.to_pleasant_string }.join("\n")
  end
end
