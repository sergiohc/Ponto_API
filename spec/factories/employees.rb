FactoryGirl.define do
  factory :employee do
    name { FFaker::Name.name }
    cpf { FFaker::IdentificationBR.cpf }
    pis "13058946502"
    office 
    team 
    user 
  end
end
