FactoryGirl.define do
  
  DETAILS = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"
  
  factory :sample_question, class: Question do
    sequence(:question) {|n| "Question number #{n}"}
    permalink { "#{question.parameterize}" }
    details DETAILS
  end
  
  factory :dummy_question, class: Question do
    sequence(:question) {|n| "This is a dummy question #{n}"}
    details DETAILS
  end
  
  factory :seed_question, class: Question do
    sequence(:question) {|n| "Seed question number #{n}"}
    permalink { "#{question.parameterize}" }
    details DETAILS
  end
  
end