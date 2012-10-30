#
# rpsls_main.rb
# Main for Class Rpsls
#

require "rpsls"

choice = ARGV.shift
game = Rpsls.new()
puts game.play(choice)