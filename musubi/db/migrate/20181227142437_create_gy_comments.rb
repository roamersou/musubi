class CreateGyComments < ActiveRecord::Migration[5.1]
  def change
    create_table :gy_comments do |t|
      t.string :content
      t.references :user, foreign_key: true
      t.references :payforward, foreign_key: true

      t.timestamps
    end
  end
end
