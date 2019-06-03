class CategoriesController < ApplicationController
  skip_before_action :authenticate_user!, :only=> :show
  #load_and_authorize_resource
  def index
    @category = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
      if @category.save
         redirect_to new_category_path
         flash[:notice] = "Category added successfully"
      else
        redirect_to new_category_path
        flash[:notice] = "Something went wrong"
      end
  end

  def show
    @category = Category.search_filter(params[:category_id], params[:price])
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
