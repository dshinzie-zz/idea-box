class SessionsController < ApplicationController
  def index
    @user = User.find(session[:user]) if session[:user]
    @idea = Idea.new
    @ideas = @user.sorted_ideas if session[:user]
    @category = Category.new
    @categories = Category.sorted_categories
    @user_new = User.new
    @image_new = Image.new
    @images = Image.all
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
    redirect_to home_path
  end
end
