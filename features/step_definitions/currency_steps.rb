### Given-s ###

### When-s ###

When(/^I update currency with value "([^"]*)" and to "([^"]*)"$/) do |value, to|
  on(AdminPage) do |page|
    page.value = value
    page.to = to
    page.submit
  end

  sleep 2
end

### Then-s ###

Then(/^currency is "([^"]*)"$/) do |value|
  on(AdminPage).verify_currency_equal value.to_f
end

Then(/^currency is not "([^"]*)"$/) do |value|
  on(AdminPage).verify_currency_not_equal value.to_f
end
