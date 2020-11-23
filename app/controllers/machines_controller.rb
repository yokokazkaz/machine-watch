class MachinesController < ApplicationController
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

  private

  def machine_params
    params.require(:machine).permit(:name, :detail, :image).merge(user_id: current_user.id)
  end
end
