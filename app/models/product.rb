class Product < ApplicationRecord
  has_one :document
  belongs_to :category
end
