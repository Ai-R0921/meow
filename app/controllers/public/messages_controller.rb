class Public::MessagesController < ApplicationController
  before_action :authenticate_user!

  def show
    #チャットするユーザーのidを取得
    @user = User.find(params[:id])
    #今まで入ったroomのidを取得
    rooms = current_user.entries.pluck(:room_id)
    #ユーザーidとroom_idが一致するentryを探す
    entries = Entry.find_by(user_id: @user.id, room_id: rooms)

    unless entries.nil?
      #entryがある場合、そのroomに入る
      @room = entries.room
    else
      #entryがなかった場合、新しいroomを作成
      @room = Room.new
      @room.save
      #現在ログインしているユーザーと相手のユーザーでentryが作られる
      Entry.create(user_id: current_user.id, room_id: @room.id)
      Entry.create(user_id: @user.id, room_id: @room.id)
    end
    @users = @room.users
    #今までやりとりしたmessageを取得
    @messages = @room.messages
    @message = Message.new(room_id: @room.id)
  end

  def create
    @message = current_user.messages.new(message_params)
    @message.save
    redirect_to request.referer
  end

  private
  def message_params
    params.require(:message).permit(:content, :room_id, :user)
  end
end



#   def create
#     if Entry.where(user_id: current_user.id, room_id: params[:message][:room_id]).present?
#       @message = Message.create(params.require(:message).permit(:user_id, :content, :room_id).merge(user_id: current_user.id))
#     else
#       flash[:alert] = "メッセージ送信に失敗しました。"
#     end
#     redirect_to "/rooms/#{@message.room_id}"
#   end
# end
