# frozen_string_literal: true

class Product < ApplicationRecord
  mount_uploaders :images, ProductsImageUploader
  belongs_to :category
  validates :description, presence: true
end
