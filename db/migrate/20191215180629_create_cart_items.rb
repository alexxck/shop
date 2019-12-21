# frozen_string_literal: true

class CreateCartItems < ActiveRecord::Migration[6.0]
  def change
    create_table :cart_items, &:timestamps
  end
end
