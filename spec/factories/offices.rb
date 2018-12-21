FactoryGirl.define do
  factory :office do
    description { FFaker::Company.position }
  end
end
