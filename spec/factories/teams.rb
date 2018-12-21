FactoryGirl.define do
  factory :team do
    description { FFaker::Company.bs }
  end
end
