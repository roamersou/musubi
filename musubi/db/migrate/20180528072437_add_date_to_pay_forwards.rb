class AddDateToPayForwards < ActiveRecord::Migration[5.1]
  def change
    add_column :pay_forwards, :date, :string
  end
end
