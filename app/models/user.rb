# frozen_string_literal: true

class User < ApplicationRecord
  authenticates_with_sorcery!
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true
end
