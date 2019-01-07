class AddColumnEmployee < ActiveRecord::Migration[5.0]
  def change
    add_column :employees, :office, :text
    add_column :employees, :team, :text
  end
end
