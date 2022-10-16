FactoryBot.define do
  factory :user do
    nickname { 'ひろき' }
    email    { Faker::Internet.free_email }
    password { 'aaBB1234' }
    password_confirmation { password }
    sex { '男' }
    birthdate { '1999-01-01' }
  end
end