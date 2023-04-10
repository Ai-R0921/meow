class Public::RelationshipsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    current_user.relationships.create(follower_id: params[:user_id], user_id: current_user.id)
  end

  def destroy
    @user = User.find(params[:user_id])
    following = current_user.relationships.find_by(follower_id: params[:user_id])
    following.destroy
  end

  # 自分がフォローした人
  def followings
    @user = User.find(params[:user_id])
    @users = @user.followings
  end
  
  # 自分をフォローした人
  def followers
    @user = User.find(params[:user_id])
    @users = @user.followers
  end


end
