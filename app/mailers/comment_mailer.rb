class CommentMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def comment_email(tomail, order, user)
    sub = "コメントがありました " + order.contract_number.to_s + " " + order.customer_number.to_s
    @user = user.username
    @url = 'http://localhost:3000/orders/' + order.id.to_s
    @comment = order.comments.last.body
    
    mail to: tomail, subject: sub
  end
end
