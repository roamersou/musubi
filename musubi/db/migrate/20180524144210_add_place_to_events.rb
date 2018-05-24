class AddPlaceToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :event_time, :date
    add_column :events, :place, :string
    add_column :events, :title, :string
  end
end
