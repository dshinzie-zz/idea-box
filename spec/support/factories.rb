FactoryGirl.define do
  factory :user do
    name "MyName"
    email
    password
    is_admin true

    factory :user_with_idea do
      ideas { create_list(:idea, 2) }
    end
  end

  factory :idea do
    name
    description
    user
    category
  end

  factory :category do
    name "MyCategory"
    description "MyDescription"
  end

  sequence :email do |n|
    "email #{n}"
  end

  sequence :password do |n|
    "password#{n}"
  end

  sequence :name do |n|
    "name #{n}"
  end

  sequence :description do |n|
    "description #{n}"
  end

end
