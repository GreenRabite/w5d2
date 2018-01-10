class SubsController < ApplicationController
  before_action :require_log_in

  def index
    @subs = Sub.all
    render :index
  end

  def new
    @sub = Sub.new
    render :new
  end

  def create
    @sub = Sub.new(subs_params)
    @sub.moderator = current_user
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def show
    @sub = Sub.find_by(id: params[:id])
    @all_subs = Sub.all
    render :show
  end

  def edit
    @sub = Sub.find_by(id: params[:id])
    render :edit
  end

  def update
    @sub = current_user.subs.find_by(id: params[:id])
    if @sub && @sub.update(subs_params)
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages if @sub
      render :edit
    end
  end

  private
  def subs_params
    params.require(:sub).permit(:title, :description)
  end
end
