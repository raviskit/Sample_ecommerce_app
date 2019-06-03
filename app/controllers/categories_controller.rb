class CategoriesController < ApplicationController
  skip_before_action :authenticate_user!, :only=> :show
  load_and_authorize_resource

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

  def show
    @category = Category.find params[:id]
    @category = @category.products
    respond_to do | format |
      format.html {}
      format.js {}
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
