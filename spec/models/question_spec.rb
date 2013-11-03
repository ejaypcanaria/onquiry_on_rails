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
  
  it { should belong_to :user }
  it { should have_many :answers }
  
  context "before save" do
    
    it { should validate_presence_of :question }
    it { should validate_presence_of :permalink }
    
    it { should ensure_length_of(:question).is_at_most(255) }
    it { should ensure_length_of(:permalink).is_at_most(255)}
    
    it { should validate_uniqueness_of(:question).with_message("already exists.") }
    
  end
  
  context "after validation" do
    it "should check the error for already exist message" do
      
      question = FactoryGirl.build(:question)
      question.save
      expect(question.already_exist?).to be_true
      
      question2 = FactoryGirl.build(:question, question: "New question")
      question2.save
      expect(question2.already_exist?).to be_false
    end
  end
  
  context "after save" do
    it "should generate a permalink based on the given question" do
      Question.set_callback(:validation, :before, :generate_permalink)
      
      question = FactoryGirl.create(:question, :dummy)
      expect(question.permalink).not_to be_nil
      expect(question.permalink).to eql(question.question.parameterize)
    end
    
  end
  
  it "should be able to retrieve a question using permalink" do
      Question.set_callback(:validation, :before, :generate_permalink)
      
      question = FactoryGirl.build(:question)
      existing_question = Question.find_by_permalink(question.permalink)
      expect(existing_question).not_to be_nil
      expect(existing_question.question).to eql(question.question)
    end
  
  it "should set the to_param to permalink" do
    Question.set_callback(:validation, :before, :generate_permalink)
    
    question = FactoryGirl.create(:question, :dummy)
    expect(question.to_param).to eql(question.question.parameterize)
  end
  
  it "should check if a given user already answer the question" do
    question = FactoryGirl.build(:question)
    answer = FactoryGirl.build(:answer)
    question.answers << answer
    
    expect(question.user_already_answered? 1).to be_true
    expect(question.user_already_answered? 2).to be_false
  end
  
end