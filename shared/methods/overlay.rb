def within_drupal_overlay &block
  sleep Capybara.default_wait_time
  within_frame 'overlay-active' do
    #sleep 1
    yield
    #sleep 1
  end
  #sleep Capybara.default_wait_time
end
