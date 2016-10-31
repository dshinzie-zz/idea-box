class SessionsController < ApplicationController
  before_action :set_params

  def index
  end

  def new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user] = @user.id
      flash[:success] = "Successfully logged in!"
      redirect_to home_path
    else
      flash[:notice] = "Wrong Credentials"
      render :index
    end
  end

  def destroy
    session.clear
    flash[:success] = "Successfully logged out!"
    redirect_to home_path
  end

  private

  def set_params
    @params = SessionHelper.set_session_params(session)
  end

end
