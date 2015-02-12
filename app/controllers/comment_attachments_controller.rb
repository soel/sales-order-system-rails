class CommentAttachmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment_attachment, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @comment_attachments = CommentAttachment.all
    respond_with(@comment_attachments)
  end

  def show
    respond_with(@comment_attachment)
  end

  def new
    @comment_attachment = CommentAttachment.new
    respond_with(@comment_attachment)
  end

  def edit
  end

  def create
    @comment_attachment = CommentAttachment.new(comment_attachment_params)
    @comment_attachment.save
    respond_with(@comment_attachment)
  end

  def update
    @comment_attachment.update(comment_attachment_params)
    respond_with(@comment_attachment)
  end

  def destroy
    @comment_attachment.destroy
    respond_with(@comment_attachment)
  end

  private
    def set_comment_attachment
      @comment_attachment = CommentAttachment.find(params[:id])
    end

    def comment_attachment_params
      params.require(:comment_attachment).permit(:comment_id, :document)
    end
end
