require 'test_helper'

class DestemailsControllerTest < ActionController::TestCase
  setup do
    @destemail = destemails(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:destemails)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create destemail" do
    assert_difference('Destemail.count') do
      post :create, destemail: { email: @destemail.email }
    end

    assert_redirected_to destemail_path(assigns(:destemail))
  end

  test "should show destemail" do
    get :show, id: @destemail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @destemail
    assert_response :success
  end

  test "should update destemail" do
    patch :update, id: @destemail, destemail: { email: @destemail.email }
    assert_redirected_to destemail_path(assigns(:destemail))
  end

  test "should destroy destemail" do
    assert_difference('Destemail.count', -1) do
      delete :destroy, id: @destemail
    end

    assert_redirected_to destemails_path
  end
end
