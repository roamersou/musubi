class AddPictureToPayforwards < ActiveRecord::Migration[5.1]
  def change
    add_column :payforwards, :picture, :string
  end
end
