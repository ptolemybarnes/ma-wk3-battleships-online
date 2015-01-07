Then(/^I should observe an aircraftcarrier$/) do
  expect(page.has_css?('.aircraftcarrier')).to eq(true)
end

When(/^then I should not observe an aircraftcarrier$/) do
  expect(page.has_css?('.aircraftcarrier')).to eq(false)
end

When(/^I hover over aircraftcarrier$/) do
  expect(find('.aircraftcarrier').hover).to eq("A1")
end