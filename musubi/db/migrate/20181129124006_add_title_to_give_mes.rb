class AddTitleToGiveMes < ActiveRecord::Migration[5.1]
  def change
  	add_column :give_mes, :title, :string
  end
end
