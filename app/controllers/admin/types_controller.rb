class Admin::TypesController < ApplicationController
  def new
    @type = Type.new
  end

  def create
    @type = Type.new(type_params)
    @type.save
    redirect_to admin_types_path
  end

  def destroy
    @type = Type.find(params[:id])
    @type.destroy
    redirect_to admin_types_path
  end

  def index
    @types = Type.all
  end


  def type_params
    params.require(:type).permit(:name)
  end
end
