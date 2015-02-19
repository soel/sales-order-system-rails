class CommentTemplatesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment_template, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @comment_templates = CommentTemplate.all
    respond_with(@comment_templates)
  end

  def show
    respond_with(@comment_template)
  end

  def new
    @comment_template = CommentTemplate.new
    respond_with(@comment_template)
  end

  def edit
  end

  def create
    @comment_template = CommentTemplate.new(comment_template_params)
    @comment_template.save
    redirect_to comment_templates_path
  end

  def update
    @comment_template.update(comment_template_params)
    redirect_to comment_templates_path
  end

  def destroy
    @comment_template.destroy
    respond_with(@comment_template)
  end

  private
    def set_comment_template
      @comment_template = CommentTemplate.find(params[:id])
    end

    def comment_template_params
      params.require(:comment_template).permit(:name, :body)
    end
end
