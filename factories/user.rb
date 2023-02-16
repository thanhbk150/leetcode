# frozen_string_literal: true

FactoryBot.define do
  sequence(:user_email) do |n|
    "user_#{n}@example.com"
  end

  sequence(:user_login) do |n|
    "login_#{n}"
  end

  factory :user do |f|
    f.email { generate(:user_email) }
    f.login { generate(:user_login) }
    f.password { '123456' }
    f.first_name { Faker::Name.first_name }
    f.last_name { Faker::Name.last_name }
    f.timezone { "Asia/Ho_Chi_Minh" }
    f.locale { "vi" }
    f.currency { "VND" }
    f.salt { SecureRandom.alphanumeric }
  end
end
