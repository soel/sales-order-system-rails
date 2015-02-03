class CommentsController < ApplicationController
  
  def create
    @user = current_user
    @order = Order.find(params[:order_id])
    @comment = @order.comments.create(comment_params)
    
    if params[:comment_attachments].present?
      params[:comment_attachments]['document'].each do |a|
        @comment_attachment = @comment.comment_attachments.create!(:document => a, :comment_id => @comment.id)
      end
    end
    
    commenter = @order.comments.pluck(:user_id)
    commenter.uniq!
    
    users = []
    commenter.each do | c |
      users << User.find(c).email
    end
    
    ordermember = @order.users.pluck(:email)
    ordergroup = @order.destemails.pluck(:email)
    
    tomail = users + ordermember + ordergroup
    tomail.uniq!
    
    CommentMailer.comment_email(tomail, @order, @user).deliver
    
    redirect_to order_path(@order)
  end
  
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :user_id, comment_attachments_attributes: [:id, :post_id, :document])
    end
end
