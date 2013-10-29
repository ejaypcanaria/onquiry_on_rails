FactoryGirl.define do
  
  factory :sample_question, class: Question do
    sequence(:question) {|n| "Question number #{n}"}
    permalink { "#{question.parameterize}" }
    details "#{(1..1000).map {'x'}.join}"
  end
  
  factory :dummy_question, class: Question do
    sequence(:question) {|n| "This is a dummy question #{n}"}
    details "#{(1..1000).map {'x'}.join}"
  end
  
  factory :seed_question, class: Question do
    sequence(:question) {|n| "Seed question number #{n}"}
    permalink { "#{question.parameterize}" }
    details "#{(1..1000).map {'x'}.join}"
  end
  
end