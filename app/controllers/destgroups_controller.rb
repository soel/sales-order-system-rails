class DestgroupsController < ApplicationController
  before_action :set_destgroup, only: [:show, :edit, :update, :destroy]
  before_action :set_destemail, only: [:new, :edit]

  respond_to :html

  def index
    @destgroups = Destgroup.all
    respond_with(@destgroups)
  end

  def show
    respond_with(@destgroup)
  end

  def new
    @destgroup = Destgroup.new
    respond_with(@destgroup)
  end

  def edit
  end

  def create
    @destgroup = Destgroup.new(destgroup_params)
    if @destgroup.save
      redirect_to destgroups_path
    else
      #respond_with(@destgroup)
      render 'new', locals: {:@destemails => Destemail.all}
    end
  end

  def update
    if @destgroup.update(destgroup_params)
      redirect_to destgroups_path
    else
      #respond_with(@destgroup)
      render 'edit', locals: {:@destemails => Destemail.all}
    end
  end

  def destroy
    @destgroup.destroy
    respond_with(@destgroup)
  end

  private
    def set_destgroup
      @destgroup = Destgroup.find(params[:id])
    end

    def set_destemail
      @destemails = Destemail.all
    end
    
    def destgroup_params
      p = params.require(:destgroup).permit(:name, :destemail_ids => [])
      p[:destemail_ids] = [] if p[:destemail_ids].nil?
      p
    end
end
