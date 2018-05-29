class AddDateToPayForwards < ActiveRecord::Migration[5.1]
  def change
    add_column :payforwards, :date, :string
  end
end
