namespace :test do 
  desc "Run cucumber tests"
  
  task :run do |t|
    puts "Running rake task '#{t}'"
    
    include_tags = ENV['include'].split(',') unless ENV['include'].nil?
    exclude_tags = ENV['exclude'].split(',') unless ENV['exclude'].nil?
    
    command_str = "cucumber -r #{WORKING_DIR}/support \
      -r #{WORKING_DIR}/features \
      -r #{WORKING_DIR}/shared/methods \
      -r #{WORKING_DIR}/shared/steps \
      DRIVER=#{DRUPAL_DRIVER} BASE_PATH=#{DRUPAL_BASE_PATH}"
    
    include_tags.each {|tag| command_str << " --tags @#{tag}"} unless include_tags.nil?
    exclude_tags.each {|tag| command_str << " --tags ~@#{tag}"} unless exclude_tags.nil?
    
    # And run the command ofc
    system command_str
  end
end