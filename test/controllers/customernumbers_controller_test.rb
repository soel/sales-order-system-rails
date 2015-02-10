require 'test_helper'

class CustomernumbersControllerTest < ActionController::TestCase
  setup do
    @customernumber = customernumbers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:customernumbers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create customernumber" do
    assert_difference('Customernumber.count') do
      post :create, customernumber: { customer_num: @customernumber.customer_num, name: @customernumber.name }
    end

    assert_redirected_to customernumber_path(assigns(:customernumber))
  end

  test "should show customernumber" do
    get :show, id: @customernumber
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @customernumber
    assert_response :success
  end

  test "should update customernumber" do
    patch :update, id: @customernumber, customernumber: { customer_num: @customernumber.customer_num, name: @customernumber.name }
    assert_redirected_to customernumber_path(assigns(:customernumber))
  end

  test "should destroy customernumber" do
    assert_difference('Customernumber.count', -1) do
      delete :destroy, id: @customernumber
    end

    assert_redirected_to customernumbers_path
  end
end
