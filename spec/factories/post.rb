FactoryBot.define do
  factory :post do
    title { Faker::Lorem.characters(number: 5) }
    body { Faker::Lorem.characters(number: 20) }
    postimage { Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/fixtures/images/test.jpeg")) }

    association :user
  end
end
