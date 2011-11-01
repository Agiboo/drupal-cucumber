# Thanks to Andreas Kyriss for this one
def drupal_click_vertical_tab(tabname)
  tab_link = find(:xpath,   "//li[contains(@class, 'vertical-tab-button')]/a/strong[.='"+tabname+"']/..")
  tab_link.click
end