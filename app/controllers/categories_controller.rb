class CategoriesController < ApplicationController

  def index

  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:success] = "Category added!"
    else
      flash[:error] = "Information missing"
    end

    redirect_to home_path
  end

  def update
    @category = Category.find(params[:id])

    if @category.update(category_params)
      flash[:success] = "Category upated!"
    else
      flash[:error] = "Information missing"
    end
    redirect_to home_path
  end

  def destroy
    @category = Category.find(params[:id])
    @category.delete

    flash[:success] = "#{@category.name} was successfully deleted!"
    redirect_to home_path
  end

  private

  def category_params
    params.require(:category).permit(:name, :description)
  end

end
