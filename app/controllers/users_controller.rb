class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params["user"])
    @user.password = BCrypt::Password.create(params["user"]["password"])
    if User.where({email: @user.email})[0]
    flash[:notice] = "Try again."
    redirect_to "/posts"
    else
    @user.save
    redirect_to "/posts"
    end
  end
  
end
