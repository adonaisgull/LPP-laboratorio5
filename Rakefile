#
# Rakefile
#

desc 'Launches all test of Rpsls class'
task :test do
  sh "ruby -Ilib test/tc_rpsls.rb"
end

desc 'Launches a single test by name'
task :t, :test_name do |t, name|
  test_name = name[:test_name]
  sh "ruby -w -Ilib test/tc_rpsls.rb --name #{test_name}"
end