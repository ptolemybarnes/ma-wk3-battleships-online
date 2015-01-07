Then(/^I should observe a cell "(.*?)"$/) do |cell|
  expect(page.should have_css("##{cell}")).to eq true
end