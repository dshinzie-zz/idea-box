class SessionsController < ApplicationController
  def index
    @user = User.find(session[:user]) if session[:user]
    @idea = Idea.new
    @ideas = Idea.sorted_ideas
    @category = Category.new
  end

  def new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user.authenticate(params[:password])
      session[:user] = @user.id
      flash[:success] = "Successfully logged in!"
      redirect_to home_path
    else
      render :new
    end
  end

  def destroy
    session.clear
    flash[:success] = "Successfully logged out!"
    redirect_to login_path
  end
end
