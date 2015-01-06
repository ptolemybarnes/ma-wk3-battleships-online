Then(/^I enter (.*)$/) do |name|
  fill_in('name', with: name)
end

Then(/^I click submit$/) do
  click_on('submit')
end

Then(/^I see (.*)$/) do |greeting|
  expect(page).to have_content(greeting)
end