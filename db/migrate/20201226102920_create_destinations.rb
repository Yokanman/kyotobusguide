class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|
      t.string :name, null: false
      t.integer :bus_stop_id, null: false
      t.integer :line_id, null: false
      t.timestamps
    end
  end
end
