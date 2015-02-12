class DestemailsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_destemail, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @destemails = Destemail.all
    #@destemails = Destemail.page(params[:page]).per(10).order(:id)
    respond_with(@destemails)
  end

  def show
    respond_with(@destemail)
  end

  def new
    @destemail = Destemail.new
    respond_with(@destemail)
  end

  def edit
  end

  def create
    @destemail = Destemail.new(destemail_params)
    if @destemail.save
      redirect_to destemails_path
    else
      respond_with(@destemail)
    end
  end

  def update
    if @destemail.update(destemail_params)
      redirect_to destemails_path
    else
      respond_with(@destemail)
    end
  end

  def destroy
    @destemail.destroy
    respond_with(@destemail)
  end

  private
    def set_destemail
      @destemail = Destemail.find(params[:id])
    end

    def destemail_params
      params.require(:destemail).permit(:email)
    end
end
