class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:user][:name])    
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to posts_path
      # here currently its redirecting  to the home page but todo is to make it redirect to the page where it show the post of the user that add that posts and also all other posts
    else
      flash[:alert] = 'invalid name or password'
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
