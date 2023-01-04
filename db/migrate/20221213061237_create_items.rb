class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :item_name
      t.integer :item_weight
      t.string :item_size
      t.references :booking, null: false, foreign_key: true

      t.timestamps
    end
  end
end
