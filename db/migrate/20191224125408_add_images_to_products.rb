# frozen_string_literal: true

class AddImagesToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :images, :string, array: true, default: []
  end
end
