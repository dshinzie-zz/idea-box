class IdeasController < ApplicationController

  def new
    @idea = Idea.new
  end

  def show
  end

  def create
    @idea = Idea.new(idea_params)
    @idea.user_id = params[:user_id]
    @user = @idea.user

    if @idea.save
      flash[:success] = "Idea added!"
    else
      flash[:error] = "Information missing"
    end

    redirect_to home_path
  end

  def update
    @idea = Idea.find(params[:id])

    if @idea.update(idea_params)
      flash[:success] = "Idea upated!"
    else
      flash[:error] = "Information missing"
    end
    redirect_to home_path
  end

  def destroy
    @idea = Idea.find(params[:id])
    @idea.delete

    flash[:success] = "#{@idea.name} was successfully deleted!"
    redirect_to home_path
  end


  private

  def idea_params
    params.require(:idea).permit(:name, :description, :user_id, :category_id, :image)
  end

end
