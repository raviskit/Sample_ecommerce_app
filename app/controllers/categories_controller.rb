class CategoriesController < ApplicationController
  def index
    @category = Category.all
  end

  def new
    @category = Category.new
  end
  def create
    @category = Category.new(category_params)
    respond_to do | format |
      if @category.save
        format.html {}
        format.json {render json: @category}
      else
        format.html {}
        format.json {render json: @product.errors}
      end
    end
  end
  private
  def category_params
    params.require(:category).permit(:name)
  end
end
