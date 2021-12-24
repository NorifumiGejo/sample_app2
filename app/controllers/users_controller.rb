class UsersController < ApplicationController
  # GET /users/:id
  def show
    @user = User.find(params[:id])
    # debugger
  end
  
  #GET /users/new
  def new
    @user = User.new
  end
  
  # POST /users (+ params)
  def create
    # (user + given params).save
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end
