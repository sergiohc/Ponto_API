class DropTableOffices < ActiveRecord::Migration[5.0]
  def change
    drop_table :offices
  end
end
