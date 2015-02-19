require 'test_helper'

class CommentTemplatesControllerTest < ActionController::TestCase
  setup do
    @comment_template = comment_templates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comment_templates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comment_template" do
    assert_difference('CommentTemplate.count') do
      post :create, comment_template: { body: @comment_template.body, name: @comment_template.name }
    end

    assert_redirected_to comment_template_path(assigns(:comment_template))
  end

  test "should show comment_template" do
    get :show, id: @comment_template
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comment_template
    assert_response :success
  end

  test "should update comment_template" do
    patch :update, id: @comment_template, comment_template: { body: @comment_template.body, name: @comment_template.name }
    assert_redirected_to comment_template_path(assigns(:comment_template))
  end

  test "should destroy comment_template" do
    assert_difference('CommentTemplate.count', -1) do
      delete :destroy, id: @comment_template
    end

    assert_redirected_to comment_templates_path
  end
end
