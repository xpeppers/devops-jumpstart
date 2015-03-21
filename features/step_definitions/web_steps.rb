require 'uri'
require 'cgi'

Given /^(?:|I )am on "(.+)"$/ do |page_name|
  visit page_name
end

When /^(?:|I )press "([^\"]*)"$/ do |button|
  click_button(button)
end

When /^(?:|I )follow "([^\"]*)"$/ do |link|
  click_link(link)
end

When /^(?:|I )fill in "([^\"]*)" with "([^\"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

Then /^(?:|I )see "([^\"]*)"$/ do |text|
  expect(page).to have_content(text)
end

