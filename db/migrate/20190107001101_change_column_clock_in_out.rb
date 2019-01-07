class ChangeColumnClockInOut < ActiveRecord::Migration[5.0]
  def change
    change_column :clock_in_outs, :hour1, :time
    change_column :clock_in_outs, :hour2, :time
    change_column :clock_in_outs, :hour3, :time
    change_column :clock_in_outs, :hour4, :time
  end
end
