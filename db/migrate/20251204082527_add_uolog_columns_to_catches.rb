class AddUologColumnsToCatches < ActiveRecord::Migration[8.1]
  def change
    add_column :catches, :condition, :string
    add_column :catches, :size, :integer
    add_column :catches, :location, :string
    add_column :catches, :tackle, :string
    add_column :catches, :memo, :text
  end
end
