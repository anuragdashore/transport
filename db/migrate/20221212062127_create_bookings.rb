class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.string :pickup_address
      t.string :pickup_city
      t.string :pickup_state
      t.string :pickup_timing
      t.string :deliver_address
      t.string :deliver_city
      t.string :deliver_state
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
