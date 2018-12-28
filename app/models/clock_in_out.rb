class ClockInOut < ApplicationRecord
  belongs_to :employee
  scope :day, -> { where(status: true) }

  def self.createClock(params) 
    create_clock = ClockInOut.where(employee_id: params[:employee_id], date: Date.today).exists?
    if !create_clock
      ClockInOut.create(date: Date.today, hour1: DateTime.now, employee_id: params[:employee_id])
    else
      clock = ClockInOut.where(employee_id: params[:employee_id], date: Date.today).last
      updateClock(clock.id)    
    end
  end

  def self.updateClock(id)
    update_clock = ClockInOut.find(id)
    if update_clock.hour2.nil?
      update_clock.hour2 = DateTime.now
      update_clock.save
    elsif update_clock.hour3.nil?
      update_clock.hour3 = DateTime.now
      update_clock.save
    else
      update_clock.hour4 = DateTime.now
      update_clock.save
    end  
  end
end
