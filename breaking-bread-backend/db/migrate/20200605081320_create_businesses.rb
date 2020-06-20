class CreateBusinesses < ActiveRecord::Migration[6.0]
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :phone
      t.string :website
      t.string :instagram
      t.references :neighborhood, null: false, foreign_key: true

      t.timestamps
    end
  end
end
