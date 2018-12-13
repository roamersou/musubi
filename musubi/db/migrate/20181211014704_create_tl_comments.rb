class CreateTlComments < ActiveRecord::Migration[5.1]
  def change
    create_table :tl_comments do |t|
      t.string :content
      t.references :user
      t.references :thanksletter, foreign_key: true
      t.timestamps
    end
  end
end
