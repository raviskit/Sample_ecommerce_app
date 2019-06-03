module ProductsHelper
  def category_ids
    Category.pluck(:name, :id)
  end
end
