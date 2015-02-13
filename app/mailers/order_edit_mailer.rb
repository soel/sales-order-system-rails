class OrderEditMailer < ActionMailer::Base
  host = `hostname`.strip
  default from: "system@" + host
  
  def order_edit_email(tomail, order, user, change_status_value, change_delivery_date_value)
    sub = "収容依頼内容の変更がありました " + order.contract_number.to_s + " " + order.customer_number.to_s
    
    @user = user.username
    host = `hostname`.strip
    @url = 'http://' + host + '/orders/' + order.id.to_s
    
    if change_status_value.present?
      @status = change_status_value[0].to_s + " => " + change_status_value[1].to_s
    end
    
    if change_delivery_date_value.present?
      @delivery_date = change_delivery_date_value[0].to_s + " => " + change_delivery_date_value[1].to_s
    end
    
    mail to: tomail, subject: sub
  end
end
