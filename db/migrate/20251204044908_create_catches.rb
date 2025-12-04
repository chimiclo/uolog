class CreateCatches < ActiveRecord::Migration[8.1]
  def change
    create_table :catches do |t|
      t.references :user, null: false, foreign_key: true
      t.string :fish_name
      t.integer :length
      t.integer :weight
      t.float :latitude
      t.float :longitude
      t.date :caught_on
      t.text :description

      t.timestamps
    end
  end
end
