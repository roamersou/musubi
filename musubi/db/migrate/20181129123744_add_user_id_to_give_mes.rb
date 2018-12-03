class AddUserIdToGiveMes < ActiveRecord::Migration[5.1]
  def change
  	add_column :give_mes, :user_id, :integer
  end
end
