def within_drupal_overlay &block
  # Adding an id to the iframe with class "overlay-active" because drupal doesn't give id's to those iframes
  # Drupal tobbles between two iframes.  I think this is because of performance/responsiveness issues
  page.execute_script("jQuery('.overlay-active').attr('id','overlay-active');")
  i=0
  until overlay_visible || i > 10
    sleep 1
    i+=1
  end
  
  within_frame 'overlay-active' do
    sleep 1
    yield
    # Removing the id of the iframe with id "overlay-active" because with the next call, we'll need this
    page.execute_script("jQuery('#overlay-active').attr('id','');")
  end
end

def overlay_visible
  # The rule below evaluates the script 
  result = page.evaluate_script("jQuery('.overlay-active').attr('class');")
  return result.nil? ? false : true
end