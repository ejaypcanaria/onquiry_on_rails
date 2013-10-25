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