class OrderEditMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def order_edit_email(tomail, order, user, change_status_value, change_delivery_date_value)
    sub = "収容依頼内容の変更がありました " + order.contract_number.to_s + " " + order.customer_number.to_s
    
    @user = user.username
    @url = 'http://localhost:3000/orders/' + order.id.to_s
    
    if change_status_value.present?
      @status = change_status_value[1]
    end
    
    if change_delivery_date_value.present?
      @delivery_date = change_delivery_date_value[1]
    end
    
    mail to: tomail, subject: sub
  end
end
