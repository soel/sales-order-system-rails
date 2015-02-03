class CommentsController < ApplicationController
  
  def create
    @user = current_user
    @order = Order.find(params[:order_id])
    @comment = @order.comments.create(comment_params)
    
     redirect_to order_path(@order)
  end
  
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :user_id)
    end
end
