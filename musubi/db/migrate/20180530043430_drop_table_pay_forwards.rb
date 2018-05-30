class DropTablePayForwards < ActiveRecord::Migration[5.1]
  def change
    drop_table :pay_forwards
  end
end
