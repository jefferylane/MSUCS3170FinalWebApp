FactoryBot.define do
  factory :three_d_file do
    sequence(:name) { |n| "Test File #{n}" }
    association :user
    file { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/test.stl'), 'model/stl') }
  end
end