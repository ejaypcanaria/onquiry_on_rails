FactoryGirl.define do
  
  factory :admin, class: User do
    first_name "Admin"
    last_name "Account"
    email "admin@onquiry.com"
    password "adminadmin123"
  end
  
  factory :user do
    first_name "Dummy"
    last_name "User"
    sequence(:email) {|n| "dummy#{n}@onquiry.com"}
    password "dummy123"
  end
  
end