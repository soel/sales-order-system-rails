class CommentMailer < ActionMailer::Base
  host = `hostname`.strip
  default from: "system@" + host
  
  def comment_email(tomail, order, user)
    sub = "コメントがありました " + order.contract_number.to_s + " " + order.customer_number.to_s
    @user = user.username
    host = `hostname`.strip
    @url = 'http://' + host + '/orders/' + order.id.to_s
    @comment = order.comments.last.body
    
    mail to: tomail, subject: sub
  end
end
