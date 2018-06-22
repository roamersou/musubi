class ChangeConversationIdToPrivateMessages < ActiveRecord::Migration[5.1]
  def change
    change_column :private_messages, :conversation_id, :string
    remove_column :private_messages, :seen, :boolean
  end
end
