class RemoveEventsTimeToEvents < ActiveRecord::Migration[5.1]
  def change
    remove_column :events, :event_time, :date
  end
end
