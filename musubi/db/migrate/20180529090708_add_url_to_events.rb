class AddUrlToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :url, :string
    remove_column :events, :place, :string
    remove_column :events, :title, :string
  end
end
