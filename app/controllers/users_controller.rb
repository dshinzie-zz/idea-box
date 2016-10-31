class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Successfully logged in!"
      session[:user] = @user.id
      redirect_to home_path
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:success] = "User upated!"
    else
      flash[:error] = "Information missing"
    end
    redirect_to home_path
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
