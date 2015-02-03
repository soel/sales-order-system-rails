class OrdersController < ApplicationController
   before_action :authenticate_user!
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @orders = Order.all
    respond_with(@orders)
  end

  def show
    respond_with(@order)
  end

  def new
    @user = current_user
    @user_select = User.where.not(id: @user.id)
    @destgroup = Destgroup.all
    @order = Order.new
    respond_with(@order)
  end

  def edit
    @destgroup = Destgroup.all
    @user_select = User.where.not(id: @user.id)
  end

  def create
    @order = Order.new(order_params)
    @order.save
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
      :user_ids => [], :destgroup_ids => [])
    end
end
