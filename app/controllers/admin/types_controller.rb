class Admin::TypesController < ApplicationController
  def new
    @type = Type.new
  end
  
  def create
    @type = Type.new(type_params)
  end

  def destroy
  end

  def index
  end
  
  
  def type_params
    params.require(:type).permit(:name)
  end
end
