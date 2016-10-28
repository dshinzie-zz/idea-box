FactoryGirl.define do
  factory :user do
    name "MyName"
    email
    password
    is_admin true
  end

  sequence :email do |n|
    "email #{n}"
  end

  sequence :password do |n|
    "password#{n}"
  end

end
