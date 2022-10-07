# frozen_string_literal: true

class Web::SessionsController < Web::ApplicationController
  def new
    @session = SessionForm.new
  end

  def create
    @session = SessionForm.new(session_params)

    redirect_to :new and return unless @session.valid?

    sign_in @session.user
    redirect_to :board
  end

  def destroy
    sign_out
    redirect_to :new_session
  end

  private

  def session_params
    params.require(:session_form).permit(:email, :password)
  end
end
