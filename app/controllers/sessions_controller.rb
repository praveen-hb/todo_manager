class SessionsController < ApplicationController
  def new
    render "index"
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render plain: "correct"
    else
      render plain: "Incorrect"
    end
  end
end
