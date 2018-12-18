class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.text :cpf
      t.text :pis
      t.references :office, foreign_key: true
      t.references :team, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
