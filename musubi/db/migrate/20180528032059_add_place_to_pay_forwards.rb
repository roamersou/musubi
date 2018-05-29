class AddPlaceToPayForwards < ActiveRecord::Migration[5.1]
  def change
    add_column :payforwards, :place, :string
  end
end
