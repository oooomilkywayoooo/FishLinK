FactoryBot.define do
  factory :user do
    nickname { 'Ta' }
    email    { Faker::Internet.email }
    password { 'aaBB1234' }
    password_confirmation { password }
    sex { '男' }
    birthdate { '1999-01-01' }
  end
end