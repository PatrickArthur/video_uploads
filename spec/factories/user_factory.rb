FactoryGirl.define do
  factory :user do
    password "password1"
    password_confirmation "password1"
    sequence :email do |i|
      "sue#{i}@example.com"
    end

     factory :user_profile do
      after(:create) do |u|
        p = create(:profile)
        u.profile = p
        u.save!
      end
    end
  end
end


