class Admin::ImagesController < Admin::BaseController

  def create
    @image = Image.new(image_params)

    if @image.save
      flash[:success] = "Image added!"
    else
      flash[:error] = "Information missing"
    end

    redirect_to home_path
  end

  def update
    @image = Image.find(params[:id])

    if @image.update(image_params)
      flash[:success] = "Image upated!"
    else
      flash[:error] = "Information missing"
    end
    redirect_to home_path
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy

    flash[:success] = "#{@image.title} was successfully deleted!"
    redirect_to home_path
  end

  private

  def image_params
    params.require(:image).permit(:title, :description, :image)
  end

end
