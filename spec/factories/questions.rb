FactoryGirl.define do
  
  DETAILS = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"
  
  factory :question, class: Question do
    
    sequence(:question) {|n| "Seed question number #{n}"}
    permalink { "#{question.parameterize}" }
    details DETAILS
    user_id 1
    
    trait :no_details do
      sequence(:question) {|n| "This is a question #{n} without details"}
      details nil
    end
    
    trait :dummy do
      sequence(:question) {|n| "This is a dummy question #{n}"}
    end
    
    trait :sample do
      sequence(:question) {|n| "Question number #{n}"}
    end
    
    trait :last_10 do
      sequence(:question, 91) {|n| "Seed question number #{n}"}
    end
    
    trait :next_10 do
      sequence(:question, 81) {|n| "Seed question number #{n}"}
    end
    
  end
  
end