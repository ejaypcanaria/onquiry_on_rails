require 'spec_helper'

describe Question do
  
  before do
    DatabaseCleaner.start
    Question.skip_callback(:validation, :before, :generate_permalink)
  end

  after do
    DatabaseCleaner.clean
    Question.set_callback(:validation, :before, :generate_permalink)
  end
  
  context "when new" do
    it "should be an instance of Question" do
      question = Question.new
      expect(question).to be_a Question
    end
  end
  
  context "before save" do
    
    it { should validate_presence_of :question }
    it { should validate_presence_of :permalink }
    
    it { should ensure_length_of(:question).is_at_most(255) }
    it { should ensure_length_of(:permalink).is_at_most(255)}
    
  end
  
  context "after save" do
    it "should generate a permalink based on the given question" do
      Question.set_callback(:validation, :before, :generate_permalink)
      
      question = FactoryGirl.create(:dummy_question)
      expect(question.permalink).not_to be_nil
      expect(question.permalink).to eql(question.question.parameterize)
    end
    
    
  end
  
  it "should be able to retrieve a question using permalink" do
      Question.set_callback(:validation, :before, :generate_permalink)
      
      question = FactoryGirl.build(:seed_question)
      existing_question = Question.find_by_permalink(question.permalink)
      expect(existing_question).not_to be_nil
      expect(existing_question.question).to eql(question.question)
    end
  
  it "should set the to_param to permalink" do
    Question.set_callback(:validation, :before, :generate_permalink)
    
    question = FactoryGirl.create(:dummy_question)
    expect(question.to_param).to eql(question.question.parameterize)
  end
  
  
end