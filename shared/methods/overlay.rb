def within_drupal_overlay &block
  page.execute_script("jQuery('.overlay-active').attr('id','overlay-active');")
  i=0
  until overlay_visible || i > 10
    sleep 1
    i+=1
  end
  
  within_frame 'overlay-active' do
    block.call
  end
end

def overlay_visible
  # The rule below evaluates the script 
  result = page.evaluate_script("jQuery('.overlay-active').attr('class');")
  return result.nil? ? false : true
end