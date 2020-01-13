# frozen_string_literal: true

class User < ApplicationRecord
  authenticates_with_sorcery!
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: {minimum: 6}
  validate :pass_val

  def pass_val
    errors.add(:password, 'must contain 1 small letter, 1 capital letter and minimum 8 symbols') if password.count('a-z') <= 0 || password.count('A-Z') <= 0
  end

  attr_accessor :password, :password_confirmation
end
