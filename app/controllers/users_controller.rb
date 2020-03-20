class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.order(:id).map { |user| user.to_pleasant_string }.join("\n")
  end

  def show
    render plain: User.find(params[:id]).to_pleasant_string
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    new_user = User.create!(
      name: name,
      email: email,
      password: password,
    )
    response_text = "New user created with id #{new_user.id}"
    render plain: response_text
  end

  def login
    render plain: User.where(email: params[:email], password: params[:password]).exists?
  end

  def update
    id = params[:id]
    user = User.find(id)
    user.password = params[:password]
    user.save!
    render plain: "password for #{user.id} updated"
  end
end
