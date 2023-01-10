class CreateBills < ActiveRecord::Migration[7.0]
  def change
    create_table :bills do |t|
      t.string :distance
      t.string :total_weight
      t.integer :total_item
      t.integer :total_ammount
      t.references :booking, null: false, foreign_key: true

      t.timestamps
    end
  end
end
