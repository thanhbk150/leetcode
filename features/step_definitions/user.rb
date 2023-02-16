# frozen_string_literal: true

Given(/^There is an account with login "(.*?)"$/) do |login|
  FactoryBot.create(:user, login: login, first_name: 'Factory', last_name: 'Bot', email: "#{login}@example.com")
end

Given(/^I log in as "(.*?)"$/) do |login|
  user = User.find_by(login: login)
  raise "Failed to login with login: #{login}" unless user

  visit '/login'
  fill_in "Email", :with => user.email
  fill_in "Password", :with => '123456'
  click_button "Log in"
end

Given(/^I am not authenticated$/) do
  visit('/logout')
end

When(/^I visit the user page$/) do
  visit '/users'
end

When(/^I click a new user button$/) do
  find("table.user .btn-new").click
end

When(/^I click a save user button$/) do
  find("form.user .btn-save").click
end

When(/^I click an edit user button number "(.*?)"$/) do |number|
  find("table.user tr:nth-child(#{number}) .btn-edit").click
end

When(/^I fill the user form as the following:$/) do |table|
  fill_form_with_table(table)
end

Then(/^I see a list of user as the following:$/) do |table|
  hashes = table.hashes

  hashes.each.with_index(1) do |hash, index|
    selector = "table.user tr:nth-child(#{index})"

    assert_selector "#{selector} > td", text: /^#{hash["First Name"]}$/, count: 1
    assert_selector "#{selector} > td", text: /^#{hash["Last Name"]}$/, count: 1
    assert_selector "#{selector} > td", text: /^#{hash["Login"]}$/, count: 1
    assert_selector "#{selector} > td", text: /^#{hash["Email"]}$/, count: 1
  end
end

Then(/^I see an error messages in the user form as the following:$/) do |table|
  table.raw.to_h.each do |field, error_message|
    within find("form.user label.form-label", text: /^#{field}$/).find(:xpath, "../..") do
      assert_selector "input.is-invalid", count: 1
      assert_selector ".invalid-feedback ", text: /^#{error_message}$/, count: 1
    end
  end
end
