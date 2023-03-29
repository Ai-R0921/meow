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
    # あいうえお順に並び替え-'その他'を選択肢から消す+'その他'を選択肢に加える→'その他'が選択肢の最後にくる
    @types = Type.order("name asc") - [Type.find_by(name: 'その他')] + [Type.find_by(name: 'その他')]
  end


  def type_params
    params.require(:type).permit(:name)
  end
end
