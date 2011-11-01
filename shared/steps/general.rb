Given /^I'm logged in as (an|a) (.*)$/ do |article,role|
  logout
  login_as role

end