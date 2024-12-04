FactoryBot.define do
  factory :three_d_file do
    sequence(:name) { |n| "Test File #{n}" }
    description { "Sample description" }
    user
    file { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/test.stl'), 'model/stl') }
  end
end