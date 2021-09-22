class MainController < ApplicationController
  before_action :set_user, only: %i[ main ]
  def main
  end
  
  def login
    @email = params[:email]
    @password = params[:password]
    @user = User.find_by(email:@email.to_s, password:@password.to_s)

    respond_to do |format| 
      if !@user.nil?
        format.html { redirect_to @user, notice: "Login successfully." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { redirect_to '/main', alert: "Wrong email or password. Please try again."}
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def set_user
    @user = User.new
  end
end
