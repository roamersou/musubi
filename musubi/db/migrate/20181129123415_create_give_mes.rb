class CreateGiveMes < ActiveRecord::Migration[5.1]
  def change
    create_table :give_mes do |t|
      t.text :content

      t.timestamps
    end
  end
end
