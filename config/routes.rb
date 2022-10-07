# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'web/boards#show'

  scope module: :web do
    resource :board, only: :show
    resource :session, only: :new
  end

  resource  :session, only: [:new, :create, :destroy], controller: 'web/sessions'
  resources :developers, only: [:new, :create], controller: 'web/developers'
end
