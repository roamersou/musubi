class AddPlaceToPayForwards < ActiveRecord::Migration[5.1]
  def change
    add_column :pay_forwards, :place, :string
  end
end
