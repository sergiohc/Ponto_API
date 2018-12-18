class CreateClockInOuts < ActiveRecord::Migration[5.0]
  def change
    create_table :clock_in_outs do |t|
      t.date :date
      t.datetime :hour1
      t.datetime :hour2
      t.datetime :hour3
      t.datetime :hour4
      t.references :employee, foreign_key: true

      t.timestamps
    end
  end
end
