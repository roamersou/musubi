class CreateThanksletters < ActiveRecord::Migration[5.1]
  def change
    create_table :thanksletters do |t|
      t.text :content
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :thanksletters, [:user_id, :created_at]
  end
end
