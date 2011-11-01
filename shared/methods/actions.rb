def login_as(role)
  visit 'user'
  role = sanitize_username role
  fill_in 'edit-name', :with => "cucumber_#{role}"
  fill_in 'edit-pass', :with => "cucumber_#{role}"
  click_button 'edit-submit'
end

def logout
  visit 'user/logout'
end