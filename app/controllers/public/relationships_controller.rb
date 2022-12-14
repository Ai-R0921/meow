class Public::RelationshipsController < ApplicationController
  def create
    current_user.relationships.create(follower_id: params[:user_id], user_id: current_user.id)
    redirect_to request.referer
  end

  def destroy
    following = current_user.relationships.find_by(follower_id: params[:user_id])
    following.destroy
    redirect_to request.referer
  end


end
