class CreatePrivateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :private_messages do |t|
      t.text :content
      t.references :user, foreign_key: true
      t.belongs_to :conversation, index: true
      t.boolean :seen, default: false
      
      t.timestamps
    end
    add_index :private_messages, [:conversation_id, :created_at]
  end
end
