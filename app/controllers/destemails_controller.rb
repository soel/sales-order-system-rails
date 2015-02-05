class DestemailsController < ApplicationController
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
    @destemail.save
    #respond_with(@destemail)
    redirect_to destemails_path
  end

  def update
    @destemail.update(destemail_params)
    #respond_with(@destemail)
    redirect_to destemails_path
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
