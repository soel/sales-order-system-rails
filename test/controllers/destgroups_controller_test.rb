require 'test_helper'

class DestgroupsControllerTest < ActionController::TestCase
  setup do
    @destgroup = destgroups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:destgroups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create destgroup" do
    assert_difference('Destgroup.count') do
      post :create, destgroup: { name: @destgroup.name }
    end

    assert_redirected_to destgroup_path(assigns(:destgroup))
  end

  test "should show destgroup" do
    get :show, id: @destgroup
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @destgroup
    assert_response :success
  end

  test "should update destgroup" do
    patch :update, id: @destgroup, destgroup: { name: @destgroup.name }
    assert_redirected_to destgroup_path(assigns(:destgroup))
  end

  test "should destroy destgroup" do
    assert_difference('Destgroup.count', -1) do
      delete :destroy, id: @destgroup
    end

    assert_redirected_to destgroups_path
  end
end
