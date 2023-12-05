class ChatroomsController < ApplicationController
  def index
    @chatrooms = Chatroom.where(asker: current_user) + Chatroom.where(helper: current_user)
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def create
    @chatroom = Chatroom.create(chatroom_params)
    redirect_to chatroom_path(@chatroom)
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:asker_id, :helper_id)
  end
end
