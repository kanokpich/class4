class MainController < ApplicationController
  before_action :set_user, only: %i[ main ]
  def main
    session[:user_id] = nil
  end
  
  def login
    @email = params[:email]
    @password = params[:password]
    @user = User.find_by(email:@email)

  
    if (@user && @user.authenticate(@password))
      session[:user_id] = @user.id
      redirect_to @user, notice: "Login successfully."
    else
      redirect_to '/main', alert: "Wrong email or password. Please try again."
    end
  end
  
  def set_user
    @user = User.new
  end
end
