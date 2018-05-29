class AddPictureToPayForwards < ActiveRecord::Migration[5.1]
  def change
    add_column :pay_forwards, :picture, :string
  end
end
