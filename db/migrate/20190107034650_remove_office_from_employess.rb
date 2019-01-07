class RemoveOfficeFromEmployess < ActiveRecord::Migration[5.0]
  def change
    remove_reference :employees, :office, foreign_key: true
  end
end
