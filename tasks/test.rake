namespace :test do 
  desc "Run cucumber tests"
  
  task :run,:run_include,:run_exclude do |t,args|
    puts "Running rake task '#{t}'"
    #args.each {|arg| puts arg}
    
   system "cucumber -r #{WORKING_DIR}/support \
     -r #{WORKING_DIR}/features \
     -r #{WORKING_DIR}/shared/methods \
     -r #{WORKING_DIR}/shared/steps \
     DRIVER=#{DRUPAL_DRIVER} BASE_PATH=#{DRUPAL_BASE_PATH}"
  end
end