class MachinesController < ApplicationController
  before_action :machine_find, only: [:show, :edit, :update, :destroy]

  def index
    @machines = Machine.all.order('created_at DESC').includes(:user)
  end

  def new
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
  end

  def update
    if @machine.update(machine_params)
      redirect_to machine_path
    else
      render :edit
    end
  end

  private

  def machine_params
    params.require(:machine).permit(:name, :detail, :image).merge(user_id: current_user.id)
  end

  def machine_find
    @machine = Machine.find(params[:id])
  end
end
