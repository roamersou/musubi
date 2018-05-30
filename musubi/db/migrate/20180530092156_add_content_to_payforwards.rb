class AddContentToPayforwards < ActiveRecord::Migration[5.1]
  def change
    add_column :payforwards, :content, :text
    add_column :payforwards, :date, :string
    add_column :payforwards, :place, :string
  end
end
