FactoryGirl.define do
  timestamp = loop do
    date = FFaker::Time.date.to_time
    break date.strftime("%F %T") if date &lt;= Date.today
  end

  factory :clock_in_out do
    date { FFaker::Time.date }
    employees
    
    hour1 timestamp

    hour2 { Faker::Time.at(Time.new(date).to_f + 
      rand * (hour1 - Time.new(date).to_f)).to_datetime }

    hour3 { Faker::Time.at(Time.new(date).to_f + 
      rand * (hour2 - Time.new(date).to_f)).to_datetime }

    hour4 { Faker::Time.at(Time.new(date).to_f + 
      rand * (hour4 - Time.new(date).to_f)).to_datetime }

  end
end

