# frozen_string_literal: true

class Category < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :products
  validates :title, presence: true, uniqueness: true
end
