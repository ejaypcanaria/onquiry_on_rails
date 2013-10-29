FactoryGirl.define do
  
  factory :admin, class: User do
    first_name "Admin"
    last_name "Account"
    email "admin@onquiry.com"
    password "adminadmin123"
  end
  
end