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
    @destgroup = Destgroup.all
    @user_select = User.where.not(id: @user.id)
    @order_all = @order.order_attachments.all
  end

  def create
    @order = Order.new(order_params)
    @order.save
    
    user = @order.users.pluck(:email)
    grmail = @order.destemails.pluck(:email)
    tomail = user + grmail
    
    OrderMailer.order_email(tomail, @order).deliver
    
    respond_with(@order)
  end

  def update
    @order.update(order_params)
    respond_with(@order)
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
