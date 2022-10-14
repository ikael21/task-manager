# frozen_string_literal: true

require 'test_helper'

class Web::DevelopersControllerTest < ActionController::TestCase
  test 'should get new' do
    get :new

    assert_response :success
  end

  test 'should post create' do
    post :create, params: { developer: attributes_for(:developer) }

    assert_response :redirect
  end

  test 'should render new when developer invalid' do
    post :create, params: { developer: { email: 'email',
                                         first_name: '',
                                         last_name: '',
                                         password: 'pass',
                                         password_confirmation: 'pass' } }

    assert_template :new
  end
end
