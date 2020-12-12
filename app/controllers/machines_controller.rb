class MachinesController < ApplicationController
  before_action :machine_find, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]

  def index
    @machines = Machine.all.order('created_at DESC').includes(:user)
  end

  def new
    redirect_to root_path if current_user.id != 1
    @machine = Machine.new
  end

  def create
    @machine = Machine.new(machine_params)
    if @machine.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    if (current_user.id != 1 && @machine.status_id == 1) || (current_user.id != 1 && @machine.subscriber.present? && @machine.subscriber != current_user.nickname)
      redirect_to root_path 
    end
  end

  def update
    if @machine.update(machine_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == 1
      @machine .destroy
      redirect_to root_path
    end
  end

  private

  def machine_params
    params.require(:machine).permit(:name, :detail, :status_id, :time, :subscriber, :checked, :image).merge(user_id: current_user.id)
  end

  def machine_find
    @machine = Machine.find(params[:id])
  end
end
