When /^I fill in the login form and I submit it$/ do
  login_as :authenticated_user
end

Then /^I am logged in$/ do
  page.should have_link 'Log out'
  page.should have_link 'My account'
end

Then /^I can see my history$/ do
  page.should have_content 'History'
end

When /^I change my e\-mail address$/ do
  click_link 'Edit'
  fill_in 'edit-current-pass', :with => 'cucumber_authenticated_user'
  fill_in 'edit-mail', :with => 'new_cucumber_authenticated_user@test.com'
  click_button 'edit-submit'
end

Then /^my e\-mail address has changed$/ do
  page.should have_content 'The changes have been saved.'
    
  # Resetting to default value
  click_link 'Edit'
  fill_in 'edit-current-pass', :with => 'cucumber_authenticated_user'
  fill_in 'edit-mail', :with => 'cucumber_authenticated_user@test.com'
  click_button 'edit-submit'
end