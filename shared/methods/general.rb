def sanitize_username(username)
  username.to_s.gsub(' ','_').downcase
end