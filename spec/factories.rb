FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "username#{n}" }
    password "secret"
    email { "#{username}@example.com" }
  end

  factory :user_params, class: :user do
    sequence(:username) { |n| "username#{n}" }
    factory :user_params_with_email, class: :user do
      email { Faker::Internet.email }
    end
    factory :user_params_with_password, class: :user do
      password { Faker::Lorem.characters(8) }
    end
  end
end
