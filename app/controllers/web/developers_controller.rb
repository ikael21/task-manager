# frozen_string_literal: true

class Web::DevelopersController < Web::ApplicationController
  def new
    @developer = Developer.new
  end

  def create
    @developer = Developer.create(developer_params)

    render(:new) unless @developer.save

    sign_in(@developer)
    redirect_to(:board)
  end

  private

  def developer_params
    params.require(:developer).permit(:first_name, :last_name,
                                      :email, :password,
                                      :password_confirmation)
  end

  def dog_params
    params.require(:dog).permit(:name, :age)
  end
end
