class AddFieldsToProfiles < ActiveRecord::Migration[8.1]
  def change
    add_column :profiles, :style, :string
    add_column :profiles, :area, :string
    add_column :profiles, :comment, :string
  end
end
