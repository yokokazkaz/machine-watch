class MachinesController < ApplicationController
  
  def index
  end

  def new
    @machine = Machine.new
  end

end
