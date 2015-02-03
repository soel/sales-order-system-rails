class OrderMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def order_email(tomail, order)
    sub = "収容依頼 " + order.contract_number.to_s + " " + order.customer_number.to_s
    @owner = order.users[0].username
    @url = 'http://localhost:3000/orders/' + order.id.to_s
    
    mail to: tomail , subject: sub
  end
end
