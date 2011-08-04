Given /^the following inline_adds:$/ do |inline_adds|
  InlineAdd.create!(inline_adds.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) inline_add$/ do |pos|
  visit inline_adds_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following inline_adds:$/ do |expected_inline_adds_table|
  expected_inline_adds_table.diff!(tableish('table tr', 'td,th'))
end
