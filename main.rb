if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require_relative 'lib/console_interface'
require_relative 'lib/game'

require 'colorize'
require 'colorized_string'

# 1. Say hello
puts "Greetz to all!\n".colorize(:green)

# 2. Load random word from file
word = File.readlines("#{__dir__}/data/words.txt", chomp: true).sample
game = Game.new(word)
console_interface = ConsoleInterface.new(game)

# 3. Do until game is over
until game.over?
#  3.1. Print out console interface
  console_interface.print_out
#  3.2. Ask a following lettter
  letter = console_interface.get_input
#  3.3. Refresh game status
  game.play!(letter)
end

# 4. Print out final game status
console_interface.print_out
