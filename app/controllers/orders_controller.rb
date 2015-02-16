class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @orders = Order.all
    respond_with(@orders)
  end

  def show
    @user = current_user
    @order_attachments = @order.order_attachments.all
    respond_with(@order)
  end

  def new
    @user = current_user
    @user_select = User.where.not(id: @user.id)
    @destgroup = Destgroup.all
    @order = Order.new
    @order_attachment = @order.order_attachments.build
    respond_with(@order)
  end

  def edit
    @user = current_user
    @owner = @order.users[0]
    @destgroup = Destgroup.all
    @user_select = User.where.not(id: @owner.id)
    #@user_select = User.all
    @order_all = @order.order_attachments.all
    
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      user = @order.users.pluck(:email)
      grmail = @order.destemails.pluck(:email)
      tomail = user + grmail
    
      OrderMailer.order_email(tomail, @order).deliver
      
      respond_with(@order)
    else
      #respond_with(@order)
      @order.attributes = order_params
      flash[:alert] = @order.errors.full_messages
      redirect_to action: :new
    end
  end

  def update
    @user = current_user
    @order.attributes = order_params
    
    change_status = @order.status_changed?
    change_status_value = @order.status_change
    change_delivery_date = @order.delivery_date_changed?
    change_delivery_date_value = @order.delivery_date_change
    
    if @order.update(order_params)
      
      if change_status or change_delivery_date
       
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
    
        OrderEditMailer.order_edit_email(tomail, @order, @user, change_status_value, change_delivery_date_value).deliver
      end
      
      respond_with(@order)
    else
    
      flash[:alert] = @order.errors.full_messages
      redirect_to action: :edit
    end
  end

  def destroy
    @order.destroy
    respond_with(@order)
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:contract_number, :customer_number, :delivery_date, :status, :web_url, :order_comment,
      order_attachments_attributes: [:id, :order_id, :document], :user_ids => [], :destgroup_ids => [])
    end
end
