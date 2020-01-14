# frozen_string_literal: true

class AddImagesToCategories < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :image, :string
  end
end
