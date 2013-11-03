require 'spec_helper'

describe ApplicationHelper do
 
 
  it "should truncate a string and append an html safe omission string" do
    question = FactoryGirl.build(:question)
   
    html_safe_question_details = helper.truncate_html(question.details, length: 220, omission: "...#{link_to 'see more',show_question_path(question)}'")

    expected = truncate(html_safe_question_details, length: 220)
    expected << "#{link_to 'see more',show_question_path(question)}'".html_safe
    
    expect(html_safe_question_details).to eql(expected)
  end

end