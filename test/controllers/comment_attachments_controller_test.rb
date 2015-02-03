require 'test_helper'

class CommentAttachmentsControllerTest < ActionController::TestCase
  setup do
    @comment_attachment = comment_attachments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comment_attachments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comment_attachment" do
    assert_difference('CommentAttachment.count') do
      post :create, comment_attachment: { comment_id: @comment_attachment.comment_id, document: @comment_attachment.document }
    end

    assert_redirected_to comment_attachment_path(assigns(:comment_attachment))
  end

  test "should show comment_attachment" do
    get :show, id: @comment_attachment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comment_attachment
    assert_response :success
  end

  test "should update comment_attachment" do
    patch :update, id: @comment_attachment, comment_attachment: { comment_id: @comment_attachment.comment_id, document: @comment_attachment.document }
    assert_redirected_to comment_attachment_path(assigns(:comment_attachment))
  end

  test "should destroy comment_attachment" do
    assert_difference('CommentAttachment.count', -1) do
      delete :destroy, id: @comment_attachment
    end

    assert_redirected_to comment_attachments_path
  end
end
