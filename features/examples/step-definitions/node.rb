When /^I create a new page$/ do
  visit 'node/add/page'
  fill_in 'edit-title', :with => "A fresh page"
  fill_in 'edit-body-und-0-value', :with => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque iaculis orci porttitor lectus laoreet tempus. Ut sed lorem quis elit tempus tempus. Cras at tortor turpis, vitae ultrices risus. Cras ornare ultricies purus, quis fringilla nibh imperdiet id. Duis a ante non sem pretium pretium."
  click_button 'edit-submit'
end

Then /^that new node is created$/ do
  page.should have_content "A fresh page"
end

When /^I create a new page that's promoted to the front page$/ do
  visit ''
  click_link 'Content'
  within_drupal_overlay do 
    click_link 'Add content'
  end
  
  within_drupal_overlay do
    
    click_link 'Basic page'
  end
  within_drupal_overlay do
    
    fill_in 'edit-title', :with => "Fresh on the front page"
    fill_in 'edit-body-und-0-value', :with => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque iaculis orci porttitor lectus laoreet tempus. Ut sed lorem quis elit tempus tempus. Cras at tortor turpis, vitae ultrices risus. Cras ornare ultricies purus, quis fringilla nibh imperdiet id. Duis a ante non sem pretium pretium."
    drupal_click_vertical_tab 'Publishing options'
    check "edit-promote"
    click_button 'edit-submit'
  end
end

Then /^I can see that new page on the front page$/ do
  visit 'node'
  page.should have_content "Fresh on the front page"
end

When /^I create a new page and unpublish it$/ do
  visit 'admin/node'
  click_link 'Add content'
  click_link 'Basic page'
  fill_in 'edit-title', :with => "New unpublished page"
  fill_in 'edit-body-und-0-value', :with => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque iaculis orci porttitor lectus laoreet tempus. Ut sed lorem quis elit tempus tempus. Cras at tortor turpis, vitae ultrices risus. Cras ornare ultricies purus, quis fringilla nibh imperdiet id. Duis a ante non sem pretium pretium."
  drupal_click_vertical_tab 'Publishing options'
  uncheck "edit-status"
  click_button 'edit-submit'
  $previous_url = current_url
end

Then /^I can't see that page anymore$/ do
  logout
  visit $previous_url
  page.should have_content "Access denied"
end