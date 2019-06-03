class Product < ApplicationRecord
  has_one :document
  belongs_to :category
  accepts_nested_attributes_for :document
end
