def within_drupal_overlay &block
  sleep Capybara.default_wait_time
  within_frame 'overlay-active' do 
    yield
  end
end
