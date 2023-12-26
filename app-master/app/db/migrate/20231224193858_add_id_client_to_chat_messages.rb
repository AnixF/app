class AddIdClientToChatMessages < ActiveRecord::Migration[7.0]
  def change
    add_column :chat_messages, :id_client, :integer
  end
end
