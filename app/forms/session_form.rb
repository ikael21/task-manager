# frozen_string_literal: true

class SessionForm
  include ActiveModel::Model

  attr_accessor :email, :password

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true
  validate  :check_user_valid

  def user
    @user ||= User.find_by(email: email)
  end

  private

  def check_user_valid
    errors.add(:email, "email or password doesn't match") unless user_valid?
  end

  def user_valid?
    user.present? && user.authenticate(password)
  end
end
