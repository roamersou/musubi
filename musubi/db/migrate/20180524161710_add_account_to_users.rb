class AddAccountToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :self_intro, :string
    add_column :users, :tw_account, :string
    add_column :users, :fb_account, :string
    add_column :users, :insta_account, :string
  end
end
