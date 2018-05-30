class CreatePayforwards < ActiveRecord::Migration[5.1]
  def change
    create_table :payforwards do |t|
      t.string :title
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :payforwards, [:user_id, :created_at]
  end
end
