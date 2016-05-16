class SessionsController < ApplicationController

  def new
    @user = User.new
    @users = User.all
  end

  def create
    user = User.find(params[:user][:id])
    if user
      session[:user_id] = user.id
      redirect_to user_path(user), notice: "Welcome back to the theme park!"
    else
      redirect_to sigin_path
    end
  end


  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
  
end
