class AddSlugToClockInOut < ActiveRecord::Migration[5.0]
  def change
    add_column :clock_in_outs, :slug, :string
    add_index :clock_in_outs, :slug, unique: true
  end
end
