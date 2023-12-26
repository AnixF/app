class ClientsController < ApplicationController
  def index
    @clients = Client.all # Получение списка всех клиентов
  end

  def new
    @client = Client.new # Создание нового экземпляра клиента
  end

  def create
    @client = Client.new(client_params) # Создание нового клиента с переданными параметрами

    if @client.save
      redirect_to clients_path, notice: 'Клиент успешно создан.' # Перенаправление на страницу списка клиентов с сообщением об успехе
    else
      render :new
    end
  end

  def chat
    @clients = Client.all # Получение списка всех клиентов
    @chat = ChatMessage.where(client_id: params[:client_id])
  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])
    if @client.update(clients_params)
      redirect_to clients_path, notice: 'Акция успешно создана.'
    else
      render :edit
    end
  end

def destroy
  @client = Client.find(params[:id])
  @client.destroy

  redirect_to clients_path, notice: 'Клиент успешно удален.'
end

  private

  def client_params
    params.permit(:name, :email, :phone)
  end
  def clients_params
  params.require(:client).permit(:name, :email, :phone)
end
end