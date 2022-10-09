#frozen_string_literal: true

class Admin::ApplicationController < ApplicationController
  include AuthHelper

  helper_method :current_user
end
