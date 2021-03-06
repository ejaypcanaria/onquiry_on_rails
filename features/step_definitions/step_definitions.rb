

#First Scenario
Given(/^I am on the welcome page$/) do
  visit '/'
end

Then(/^I should see a "(.*?)" page$/) do |text|
  page.should have_content text
end



#Second Scenario
Given(/^I am on the welcome page again$/) do
  visit '/'
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |element, value|
   fill_in element, with: value
end

When(/^I click "(.*?)"$/) do |element|
  click_on element
end

Then(/^I should see "(.*?)"$/) do |text|
  page.should have_content text
end

#Third Scenario
Given(/^I am on the welcome page for registration$/) do
  visit '/'
end

Then(/^I should see an error "(.*?)"$/) do |text|
  page.should have_content text
end

Given(/^"(.*?)" email already exists$/) do |email|
  visit '/'
  user = User.new
  user.first_name = "Ejay"
  user.last_name = "Canaria"
  user.password = "xxxxxxxx"
  user.email = email
  user.save
end

Then(/^I should be redirected to "(.*?)"$/) do |path|
  current_path.should == path
end

Given(/^I am not yet logged in$/) do

end

When(/^I access "(.*?)"$/) do |path|
  visit path
end

Given(/^I am already signed in$/) do
  user = FactoryGirl.build(:admin)
  sign_in(user)
end


Then(/^if I access "(.*?)" I should be redirected to "(.*?)"$/) do |source_page, target_page|
  visit source_page
  current_path.should == target_page
end

Then(/^I should see the last 10 seed questions$/) do
  10.times do
    question = FactoryGirl.build(:question, :last_10)
    page.should have_content question.question
  end
end

Then(/^I should see next (\d+) seed questions$/) do |question_count|
  10.times do
    question = FactoryGirl.build(:question, :next_10)
    page.should have_content question.question
  end
end

Then(/^I should see "(.*?)" in question$/) do |content|
  within(:css, "span.asker") do
    page.should have_content content
  end
end

Then(/^I should be redirected to "(.*?)" page$/) do |page|
  current_path.should == show_question_path(page.parameterize)
end

Given(/^I ask a question "(.*?)"$/) do |question|
  user = FactoryGirl.build(:user)
  sign_in(user)
  ask(question)
end

Then(/^I should not see "(.*?)"$/) do |content|
  page.should_not have_content content
end

Given(/^I am on a question "(.*?)"$/) do |question|
  user = FactoryGirl.build(:user)
  sign_in(user)
  ask(question)
end

Then(/^I should see a link or button "(.*?)"$/) do |name|
  page.should have_selector(:link_or_button, name)
end

Then(/^I should not see a link or button "(.*?)"$/) do |name|
  page.should_not have_selector(:link_or_button, name)
end

