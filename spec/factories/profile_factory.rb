include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :profile do
    sequence :name do |i|
      "#{i}"
    end
    address "407 Hudson Ave"
    city "Albany"
    state "NY"
    phone "518-123-4567"
    zip "12205"
    avatar { fixture_file_upload( File.join(Rails.root, 'spec', 'support', 'fixtures', 'test.png'), 'image/png') }
  end
end








