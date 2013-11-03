require 'spec_helper'

describe Answer do
  
  context "when new" do
    it "should be an instance of Answer model" do
      answer = Answer.new
      expect(answer).to be_a Answer
    end
  end  
  
  it { should belong_to :question }
  it { should belong_to :user }
  
  context "before save" do
    it { should validate_presence_of :answer }
  end
  
end
