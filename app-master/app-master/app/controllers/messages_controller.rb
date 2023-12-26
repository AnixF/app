class MessagesController < ApplicationController
  def create
    @message = ChatMessage.new(message_params)
	@message.user_id = current_user.id  # Сохранение id пользователя с сообщением
    if @message.save
      redirect_to messages_path(client_id: params[:client_id],
	  client_name: params[:client_name])
	  
    else
      render :new
    end
  end

def chat
  @chat = ChatMessages.all # Получение списка всех клиентов
end
  private

def message_params
  params.permit(:client_id, :message)
end
end