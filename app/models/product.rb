# frozen_string_literal: true

class Product < ApplicationRecord
  mount_uploaders :images, ProductsImageUploader
  belongs_to :category
  validates :title, uniqueness: true, presence: true
  validates :description, presence: true
  has_rich_text :description
end
