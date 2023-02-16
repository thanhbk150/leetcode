# frozen_string_literal: true

When(/^I visit the dashboard page$/) do
  visit '/'
end

Then(/^I see the dashboard title$/) do
  within "body" do
    assert_selector("h1", text: 'Dashboard', count: 1)
  end
end
