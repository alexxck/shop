class CartItem < ApplicationRecord
  belongs_to :cart
  validates :title, presence: true, uniqueness: true
end
