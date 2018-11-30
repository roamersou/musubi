class AddPictureToGiveMes < ActiveRecord::Migration[5.1]
  def change
  	add_column :give_mes, :picture, :string
  end
end
