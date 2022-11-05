# frozen_string_literal: true

class Admin::ApplicationController < ApplicationController
  include AuthHelper

  helper_method :current_user

  before_action :authenticate_user!, :authorize

  private

  def authorize
    if forbidden?
      error_file = Rails.public_path.join('403.html')
      render(file: error_file, status: :forbidden, layout: false)
    end
  end

  def forbidden?
    !current_user.is_a?(Admin)
  end
end
