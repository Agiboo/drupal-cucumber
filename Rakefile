WORKING_DIR = File.dirname(__FILE__)

# Require all all ruby files inside the "tasks" directory 
Dir.glob( File.join( WORKING_DIR, 'tasks', '*.rb')).each { |rb| require rb }
# Import all rake tasks in subdir "tasks"
Dir.glob( File.join( WORKING_DIR, 'tasks', '*.rake' ) ).each { |r| import r }