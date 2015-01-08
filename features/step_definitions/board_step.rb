Then(/^I should observe a cell "(.*?)"$/) do |cell|
  expect(page.should have_css("##{cell}")).to eq true
end

When(/^I shoot at a cell "(.*?)"$/) do |arg1|
  find("##{arg1}").click
end

When(/^I shoot at a cell "(.*?)" with ship$/) do |arg1|
  find("##{arg1}").click
end
