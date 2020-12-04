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
    redirect_to root_path if current_user.id != 1
  end

  def update
    if @machine.update(machine_params)
      redirect_to machine_path
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

  def checked
    if current_user.id == 1
      machine = Machine.find(params[:id])
      if machine.checked 
        machine.update(checked: false)
      else
        machine.update(checked: true)
      end

      item = Machine.find(params[:id])
      render json: { machine: item }
    end
  end

  private

  def machine_params
    params.require(:machine).permit(:name, :detail, :checked, :image).merge(user_id: current_user.id)
  end

  def machine_find
    @machine = Machine.find(params[:id])
  end
end
