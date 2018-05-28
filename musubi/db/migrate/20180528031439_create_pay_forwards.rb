class CreatePayForwards < ActiveRecord::Migration[5.1]
  def change
    create_table :pay_forwards do |t|
      t.string :title
      t.text :content
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :pay_forwards, [:user_id, :created_at]
  end
end
