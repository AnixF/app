class RenameIdClientToUsersIdInChatMessages < ActiveRecord::Migration[7.0]
  def change
	rename_column :messages, :id_client, :user_id
  end
end
