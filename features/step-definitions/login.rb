When /^I visit the login page$/ do
  visit 'user/login'
end

Then /^I see the login form$/ do
  ['#edit-name','#edit-pass','#edit-submit'].each do |html_element|
    page.should have_css html_element
  end
end

When /^I change my profile details$/ do
  #edit-button = find(:xpath, '//a[contains]')
  click_link 'Edit'
end

Then /^the profile changes are in effect$/ do
  within_drupal_overlay do
    fill_in 'edit-current-pass',:with => '********'
  end
end

Then /^I can navigate through the site$/ do
  visit '/'
  sleep 2
  click_link 'Structure'
  sleep 2
  within_drupal_overlay do
    click_link 'Content types'
    sleep 2
  end
  within_drupal_overlay do
    click_link 'manage fields'
    sleep 2
  end
  within_drupal_overlay do
    click_link 'Manage display'
    sleep 2
  end
end