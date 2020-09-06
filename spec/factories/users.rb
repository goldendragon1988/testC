FactoryBot.define do
  factory :user do
    sequence(:email)              { |n| "testy.macuserton-#{n}@example.com" }
    password                      {"password"}
    password_confirmation         {"password"}
    first_name                    {"Testy"}
    last_name                     {"MacUserton"}
  end
end
