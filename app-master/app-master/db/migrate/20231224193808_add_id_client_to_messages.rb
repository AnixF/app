class AddIdClientToMessages < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :id_client, :integer
  end
end
