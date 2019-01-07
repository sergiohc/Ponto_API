class ClockInOut < ApplicationRecord
  belongs_to :employee
  scope :day, -> { where(status: true) }

  def self.createClock(params) 
    create_clock = ClockInOut.where(employee_id: params[:employee_id], date: Date.today).exists?
    if !create_clock
      ClockInOut.create(date: Date.today, hour1: Time.now, employee_id: params[:employee_id])
    else
      clock = ClockInOut.where(employee_id: params[:employee_id], date: Date.today).last
      updateClock(clock.id)    
    end
  end
  
  # esta inserindo hour 1 e 2 neste metodo :/
  def self.create_Clock(params)
    now = DateTime.now
    clock = ClockInOut.find_or_create_by(employee_id: params[:employee_id], date: Date.today) { |c| c.hour1 = now }
    return clock.update(hour2: now) if clock.hour2.nil? 
    return clock.update(hour3: now) if clock.hour3.nil?
    return clock.update(hour4: now) if clock.hour4.nil?
  end

  def self.updateClock(id)
    t = Time.now
    update_clock = ClockInOut.find(id)
    if update_clock.hour2.nil?
      update_clock.hour2 =  t
      update_clock.save
    elsif update_clock.hour3.nil?
      update_clock.hour3 =  t
      update_clock.save
    else
      update_clock.hour4 =  t
      update_clock.save
    end  
  end

  def self.import_afd(clock_id)
    #seta e funcionario
    employee = self.find(clock_id)
    #cria o arquivo  tipo 1.3.Registro de marcação de ponto
    arq = File.new("importAFD.txt", "w")
    23212345674
    #simula numeracao nsr
    layout = "323456367" 
    #tipo do registro, "3".
    layout += "3"
    #Data da marcação de ponto, no formato ddmmaaa
    layout += employee.date.strftime('%d%m%Y')   
    #Horário da marcação de ponto, no Formato "hhmm".
    layout += employee.date.strftime('%I%M') 
    #Número do PIS do empregado
    layout += employee.employee.pis
    arq.puts(layout)
    arq.close 
  end
end
