class RenameIdClientToUsersIdInMessages < ActiveRecord::Migration[7.0]
  def change
	rename_column :chat_messages, :id_client, :user_id
  end
end
