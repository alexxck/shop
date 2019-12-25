# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :category
  mount_uploaders :images, ProductsImageUploader
end
