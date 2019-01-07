class RemoveTeamsFromEmployes < ActiveRecord::Migration[5.0]
  def change
    remove_reference :employees, :team, foreign_key: true
  end
end
