class OrderMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def order_email(tomail, order)
    sub = "収容依頼 " + order.contract_number.to_s + " " + order.customer_number.to_s
    @owner = order.users[0].username
    host = `hostname`.strip
    @url = 'http://' + host + '/orders/' + order.id.to_s
    
    @contract = order.contract_number
    @customer = order.customer_number
    @comment = order.order_comment
    
    mail to: tomail , subject: sub
  end
end
