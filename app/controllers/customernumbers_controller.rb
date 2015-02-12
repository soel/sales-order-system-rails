class CustomernumbersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_customernumber, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @customernumbers = Customernumber.all
    respond_with(@customernumbers)
  end

  def show
    respond_with(@customernumber)
  end

  def new
    if Customernumber.last.present?
      number = Customernumber.last.customer_num + 1
      @customernumber = Customernumber.new(:customer_num => number)
    else
      @customernumber = Customernumber.new
    end
    respond_with(@customernumber)
  end

  def edit
  end

  def create
    @customernumber = Customernumber.new(customernumber_params)
    if @customernumber.save
      redirect_to customernumbers_path
    else
      respond_with(@customernumber)
    end
  end

  def update
    if @customernumber.update(customernumber_params)
      redirect_to customernumbers_path
    else
      respond_with(@customernumber)
    end
  end

  def destroy
    @customernumber.destroy
    respond_with(@customernumber)
  end

  private
    def set_customernumber
      @customernumber = Customernumber.find(params[:id])
    end

    def customernumber_params
      params.require(:customernumber).permit(:customer_num, :name)
    end
end
