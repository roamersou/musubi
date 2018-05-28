class AddReceiverIdToThanksletters < ActiveRecord::Migration[5.1]
  def change
    add_column :thanksletters, :receiver_id, :integer
  end
end
